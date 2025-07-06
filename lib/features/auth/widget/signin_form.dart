import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/signin_viewmodel.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SignInViewModel>(context);
    final primaryColor = Theme.of(context).primaryColor;

    final inputDecoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: primaryColor),
      ),
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
    );

    return Form(
      key: vm.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email Label
          Text("Email Address", style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 10),

          // Email Input
          TextFormField(
            decoration: inputDecoration.copyWith(hintText: 'Enter your email'),
            onChanged: vm.setUsername,
            validator: (val) =>
                val == null || val.isEmpty ? 'Email required' : null,
          ),
          const SizedBox(height: 20),

          // Password Label and Show/Hide toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Password", style: Theme.of(context).textTheme.labelSmall),
              GestureDetector(
                onTap: () => setState(() => _obscureText = !_obscureText),
                child: Text(
                  _obscureText ? "Show" : "Hide",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Password Input
          TextFormField(
            obscureText: _obscureText,
            decoration: inputDecoration.copyWith(
              hintText: 'Enter your password',
            ),
            onChanged: vm.setPassword,
            validator: (val) =>
                val == null || val.isEmpty ? 'Password required' : null,
          ),

          // Forget Password Button
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {}, // Future implementation
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                textStyle: Theme.of(context).textTheme.labelSmall,
                padding: EdgeInsets.zero,
              ),
              child: const Text("Forget Password?"),
            ),
          ),

          const SizedBox(height: 8),

          // Signup Prompt
          Center(
            child: Wrap(
              children: [
                Text(
                  "Don't have an account yet? ",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                GestureDetector(
                  onTap: () {}, // Future signup logic
                  child: Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: vm.isLoading ? null : () => vm.signIn(context),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: vm.isLoading
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Sign In'),
            ),
          ),

          const SizedBox(height: 30),

          // Divider
          Row(
            children: const [
              Expanded(child: Divider(thickness: 1)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('OR'),
              ),
              Expanded(child: Divider(thickness: 1)),
            ],
          ),

          const SizedBox(height: 20),

          // Google Sign-In Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                // Future: Implement Google Sign-In
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/google_icon.png', // ✅ Local asset path
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  const Text('Sign in with Google'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Apple Sign-In Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                // Future: Implement Apple Sign-In
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.apple, size: 25, color: Colors.black),
                  const SizedBox(width: 10),
                  const Text('Sign in with Apple'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
