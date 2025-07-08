import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/signup_viewmodel.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _acceptTerms = false;
  bool _showTermsWarning = false;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<SignUpViewModel>(context);
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
          Text("Full Name", style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 10),
          TextFormField(
            decoration: inputDecoration.copyWith(
              hintText: 'Enter your full name',
            ),
            onChanged: vm.setFullName,
            validator: (val) =>
                val == null || val.isEmpty ? 'Full name required' : null,
          ),
          const SizedBox(height: 20),

          Text("Email Address", style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 10),
          TextFormField(
            decoration: inputDecoration.copyWith(hintText: 'Enter your email'),
            onChanged: vm.setEmail,
            validator: (val) =>
                val == null || val.isEmpty ? 'Email required' : null,
          ),
          const SizedBox(height: 20),

          Text("Phone", style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: inputDecoration.copyWith(
              hintText: 'Enter your phone number',
            ),
            onChanged: vm.setPhone,
            validator: (val) =>
                val == null || val.isEmpty ? 'Phone number required' : null,
          ),
          const SizedBox(height: 20),

          Text("Password", style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 10),
          TextFormField(
            obscureText: _obscurePassword,
            decoration: inputDecoration.copyWith(
              hintText: 'Enter your password',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  size: 18,
                ),
                onPressed: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
              ),
            ),
            onChanged: vm.setPassword,
            validator: (val) =>
                val == null || val.length < 6 ? 'Password too short' : null,
          ),
          const SizedBox(height: 20),

          Text(
            "Repeat Password",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 10),
          TextFormField(
            obscureText: _obscureConfirm,
            decoration: inputDecoration.copyWith(
              hintText: 'Re-enter your password',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirm ? Icons.visibility : Icons.visibility_off,
                  size: 18,
                ),
                onPressed: () =>
                    setState(() => _obscureConfirm = !_obscureConfirm),
              ),
            ),
            onChanged: vm.setConfirmPassword,
            validator: (val) =>
                val != vm.password ? 'Passwords do not match' : null,
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Checkbox(
                value: _acceptTerms,
                activeColor: primaryColor,
                onChanged: (val) {
                  setState(() {
                    _acceptTerms = val ?? false;
                    _showTermsWarning = false;
                  });
                },
              ),
              Expanded(
                child: Text(
                  'By signing up, you agree to our Terms and Conditions.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),

          if (_showTermsWarning)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'You must agree to the Terms and Conditions to continue.',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.red),
              ),
            ),

          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: vm.isLoading
                  ? null
                  : () {
                      if (!_acceptTerms) {
                        setState(() {
                          _showTermsWarning = true;
                        });
                        return;
                      }
                      vm.signUp(context);
                    },
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
                  : const Text('Sign Up'),
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
                  const Text('Sign up with Google'),
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
                  const Text('Sign up with Apple'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          Center(
            child: Wrap(
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(fontSize: 13),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Goes back to Sign In Page
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: primaryColor, // or Theme.of(context).primaryColor
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
