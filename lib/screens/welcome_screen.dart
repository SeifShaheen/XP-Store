import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xp_store/screens/signup_screen.dart';
import 'package:xp_store/screens/signin_screen.dart';
import 'package:xp_store/l10n/app_localizations.dart';
import 'package:xp_store/providers/language_provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1A1A1A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            'Select Language',
            style: TextStyle(
              fontFamily: 'Suwannaphum',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00FF88),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Text('🇺🇸', style: TextStyle(fontSize: 24)),
                title: const Text(
                  'English',
                  style: TextStyle(
                    fontFamily: 'Suwannaphum',
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // Change locale to English
                  _changeLanguage(context, const Locale('en'));
                },
              ),
              ListTile(
                leading: const Text('🇸🇦', style: TextStyle(fontSize: 24)),
                title: const Text(
                  'العربية',
                  style: TextStyle(
                    fontFamily: 'Suwannaphum',
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // Change locale to Arabic
                  _changeLanguage(context, const Locale('ar'));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _changeLanguage(BuildContext context, Locale locale) {
    final languageProvider = Provider.of<LanguageProvider>(
      context,
      listen: false,
    );
    languageProvider.changeLanguage(locale);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Language changed to ${locale.languageCode == 'ar' ? 'Arabic' : 'English'}',
        ),
        backgroundColor: const Color(0xFF00FF88),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        title: Text(
          l10n.appTitle,
          style: const TextStyle(
            fontFamily: 'Suwannaphum',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        centerTitle: true,
        actions: [
          // Language toggle button
          IconButton(
            icon: const Icon(Icons.language, color: Colors.white),
            onPressed: () {
              _showLanguageDialog(context);
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A1A1A), Color(0xFF0A0A0A)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: ListView(
                children: [
                  // Gaming-themed title
                  Text(
                    l10n.welcomeTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Suwannaphum',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00FF88),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Subtitle
                  Text(
                    l10n.welcomeSubtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Suwannaphum',
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Images row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Local gaming image placeholder
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF00FF88), Color(0xFF00CC6A)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF00FF88).withOpacity(0.3),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.sports_esports,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),

                      // Online gaming image
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFF6B35), Color(0xFFE55A2B)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFF6B35).withOpacity(0.3),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.gamepad,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),

                  // Action buttons
                  Column(
                    children: [
                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00FF88),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 8,
                            shadowColor: const Color(
                              0xFF00FF88,
                            ).withOpacity(0.4),
                          ),
                          child: Text(
                            l10n.signUp,
                            style: const TextStyle(
                              fontFamily: 'Suwannaphum',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFF00FF88),
                            side: const BorderSide(
                              color: Color(0xFF00FF88),
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            l10n.signIn,
                            style: const TextStyle(
                              fontFamily: 'Suwannaphum',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Gaming tagline
                  Center(
                    child: Text(
                      l10n.levelUpTagline,
                      style: const TextStyle(
                        fontFamily: 'Suwannaphum',
                        fontSize: 14,
                        color: Colors.white54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
