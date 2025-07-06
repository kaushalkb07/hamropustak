import 'package:flutter/material.dart';
import '../widget/signin_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              // Logo
              Center(
                child: Image.network(
                  'https://hamropustak.com/assets/icons/logo.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 40),

              // Welcome Back Text
              Center(
                child: Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40, // ✅ Adjusted font size
                    fontWeight: FontWeight.w700, // ✅ Increased font weight
                    color: primaryColor,
                  ),
                ),
              ),

              const SizedBox(height: 5),

              // Login prompt
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Do you have an account? Login",
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: primaryColor),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              const SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
