import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../utils/error_alert.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final void Function()? moveToLogin;

  RegisterPage({super.key, required this.moveToLogin});

  void register(BuildContext context) async {
    final authService = AuthService();
    try {
      if (_passwordController.text != _confirmPasswordController.text) {
        throw Exception("Password should match");
      }
      await authService.signUpWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
    } catch (e) {
      displayError(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.telegram,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 10),

            Text(
              "EMBRACE SIMPLICITY",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 15),

            MyTextField(hintText: "Email", controller: _emailController),

            const SizedBox(height: 10),

            MyTextField(
              hintText: "Password",
              controller: _passwordController,
              hideText: true,
            ),

            const SizedBox(height: 10),

            MyTextField(
              hintText: "Confirm password",
              controller: _confirmPasswordController,
              hideText: true,
            ),

            const SizedBox(height: 25),

            MyButton(text: "Register", onTap: () => register(context)),
            const SizedBox(height: 25),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: moveToLogin,
                    child: Text(
                      "Login now!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
