import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../service/auth_service.dart';

class SignInViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  String _username = '';
  String _password = '';
  bool isLoading = false;

  void setUsername(String value) {
    _username = value;
  }

  void setPassword(String value) {
    _password = value;
  }

  Future<void> signIn(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    notifyListeners();

    try {
      UserModel user = await _authService.signIn(_username, _password);

      // On success, navigate to dummy home
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SuccessScreen(user: user)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

// Dummy success screen
class SuccessScreen extends StatelessWidget {
  final UserModel user;
  const SuccessScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome")),
      body: Center(
        child: Text(
          'Welcome, ${user.username}!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
