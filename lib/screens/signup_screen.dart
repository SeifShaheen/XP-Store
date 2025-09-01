import 'package:flutter/material.dart';
import 'package:xp_store/models/user.dart';
import 'package:xp_store/screens/shopping_screen.dart';
import 'package:xp_store/l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            l10n.accountCreatedSuccess,
            style: const TextStyle(
              fontFamily: 'Suwannaphum',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00FF88),
            ),
          ),
          content: Text(
            l10n.accountCreatedMessage,
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

  void _handleSignUp() async {
    final l10n = AppLocalizations.of(context);

    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      final user = User.createUser(
        fullName: _fullNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      );

      setState(() {
        _isLoading = false;
      });

      if (user != null) {
        _showSuccessDialog();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.checkInputAndTryAgain),
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
          l10n.createAccount,
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
                  const SizedBox(height: 20),

                  // Title
                  Text(
                    l10n.joinCommunity,
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
                    l10n.createAccountSubtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Suwannaphum',
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Full Name Field
                  TextFormField(
                    controller: _fullNameController,
                    style: const TextStyle(
                      fontFamily: 'Suwannaphum',
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: l10n.fullName,
                      labelStyle: const TextStyle(
                        fontFamily: 'Suwannaphum',
                        color: Colors.white70,
                      ),
                      hintText: l10n.enterFullName,
                      hintStyle: const TextStyle(
                        fontFamily: 'Suwannaphum',
                        color: Colors.white54,
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
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
                        return l10n.pleaseEnterFullName;
                      }
                      if (!User.isValidName(value)) {
                        return l10n.firstLetterMustBeUppercase;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

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
                  const SizedBox(height: 20),

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

                  // Confirm Password Field
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    style: const TextStyle(
                      fontFamily: 'Suwannaphum',
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: l10n.confirmPassword,
                      labelStyle: const TextStyle(
                        fontFamily: 'Suwannaphum',
                        color: Colors.white70,
                      ),
                      hintText: l10n.enterConfirmPassword,
                      hintStyle: const TextStyle(
                        fontFamily: 'Suwannaphum',
                        color: Colors.white54,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
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
                        return l10n.pleaseConfirmPassword;
                      }
                      if (!User.passwordsMatch(
                        _passwordController.text,
                        value,
                      )) {
                        return l10n.passwordsMustMatch;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),

                  // Sign Up Button
                  SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleSignUp,
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
                              l10n.createAccountButton,
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
            ),
          ),
        ),
      ),
    );
  }
}
