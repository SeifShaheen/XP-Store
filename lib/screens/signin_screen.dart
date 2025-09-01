import 'package:flutter/material.dart';
import 'package:xp_store/models/user.dart';
import 'package:xp_store/screens/shopping_screen.dart';
import 'package:xp_store/l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showSuccessDialog() {
    final l10n = AppLocalizations.of(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1A1A1A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            l10n.signInSuccess,
            style: const TextStyle(
              fontFamily: 'Suwannaphum',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00FF88),
            ),
          ),
          content: Text(
            l10n.signInMessage,
            style: const TextStyle(
              fontFamily: 'Suwannaphum',
              color: Colors.white70,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShoppingScreen(),
                  ),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00FF88),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                l10n.close,
                style: const TextStyle(
                  fontFamily: 'Suwannaphum',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _handleSignIn() async {
    final l10n = AppLocalizations.of(context);

    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      final canSignIn = User.canSignIn(
        _emailController.text.trim(),
        _passwordController.text,
      );

      setState(() {
        _isLoading = false;
      });

      if (canSignIn) {
        _showSuccessDialog();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.invalidCredentials),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        title: Text(
          l10n.signIn,
          style: const TextStyle(
            fontFamily: 'Suwannaphum',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),

                  // Title
                  Text(
                    l10n.welcomeBack,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Suwannaphum',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00FF88),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    l10n.signInSubtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Suwannaphum',
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      fontFamily: 'Suwannaphum',
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: l10n.email,
                      labelStyle: const TextStyle(
                        fontFamily: 'Suwannaphum',
                        color: Colors.white70,
                      ),
                      hintText: l10n.enterEmail,
                      hintStyle: const TextStyle(
                        fontFamily: 'Suwannaphum',
                        color: Colors.white54,
                      ),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color(0xFF00FF88),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF00FF88),
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF1A1A1A),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return l10n.pleaseEnterEmail;
                      }
                      if (!User.isValidEmail(value)) {
                        return l10n.emailMustIncludeAt;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(
                      fontFamily: 'Suwannaphum',
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: l10n.password,
                      labelStyle: const TextStyle(
                        fontFamily: 'Suwannaphum',
                        color: Colors.white70,
                      ),
                      hintText: l10n.enterPassword,
                      hintStyle: const TextStyle(
                        fontFamily: 'Suwannaphum',
                        color: Colors.white54,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xFF00FF88),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF00FF88),
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF1A1A1A),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return l10n.pleaseEnterPassword;
                      }
                      if (!User.isValidPassword(value)) {
                        return l10n.passwordMustBeAtLeast6;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Forgot Password Link
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Forgot password feature coming soon!',
                            ),
                            backgroundColor: Color(0xFF00FF88),
                          ),
                        );
                      },
                      child: Text(
                        l10n.forgotPassword,
                        style: const TextStyle(
                          fontFamily: 'Suwannaphum',
                          color: Color(0xFF00FF88),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Sign In Button
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleSignIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00FF88),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 8,
                        shadowColor: const Color(0xFF00FF88).withOpacity(0.4),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.black,
                                ),
                              ),
                            )
                          : Text(
                              l10n.signInButton,
                              style: const TextStyle(
                                fontFamily: 'Suwannaphum',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.dontHaveAccount,
                        style: const TextStyle(
                          fontFamily: 'Suwannaphum',
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          l10n.signUp,
                          style: const TextStyle(
                            fontFamily: 'Suwannaphum',
                            color: Color(0xFF00FF88),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
