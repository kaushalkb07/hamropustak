import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String? _email;
  String? _password;
  String? _confirmPassword;
  String? _fullname;
  String? _phone;

  void setFullName(String fullname) => _fullname = fullname;
  void setEmail(String email) => _email = email;
  void setPassword(String password) => _password = password;
  void setConfirmPassword(String confirmPassword) => _confirmPassword = confirmPassword;
  void setPhone(String phone) => _phone = phone;

  String? get password => _password;

  Future<void> signUp(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    isLoading = false;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Account created successfully!')),
    );
  }
}
