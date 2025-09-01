import 'package:email_validator/email_validator.dart';

class User {
  final String id;
  final String fullName;
  final String email;
  final String password;
  final DateTime createdAt;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.createdAt,
  });

  // Validation methods
  static bool isValidEmail(String email) {
    return EmailValidator.validate(email);
  }

  static bool isValidPassword(String password) {
    return password.length >= 6;
  }

  static bool isValidName(String name) {
    return name.isNotEmpty && name[0].toUpperCase() == name[0];
  }

  static bool passwordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  // Create user from form data
  static User? createUser({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    if (!isValidName(fullName)) {
      return null;
    }
    if (!isValidEmail(email)) {
      return null;
    }
    if (!isValidPassword(password)) {
      return null;
    }
    if (!passwordsMatch(password, confirmPassword)) {
      return null;
    }

    return User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      fullName: fullName,
      email: email,
      password: password,
      createdAt: DateTime.now(),
    );
  }

  // Sign in validation
  static bool canSignIn(String email, String password) {
    return isValidEmail(email) && isValidPassword(password);
  }
}
