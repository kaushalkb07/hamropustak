import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/signup_viewmodel.dart';
import '../widget/signup_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Image.network(
                    'https://hamropustak.com/assets/icons/logo.png',
                    height: 100,
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    "Create Account",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 32),
                const SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
