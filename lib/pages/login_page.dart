import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:flutter/material.dart';

import '../components/my_textfield.dart';
import '../utils/error_alert.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? moveToRegister;

  LoginPage({super.key, required this.moveToRegister});

  void login(BuildContext context) async {
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(
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
            const SizedBox(height: 25),
            MyButton(text: "Login", onTap: () => login(context)),
            const SizedBox(height: 25),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: moveToRegister,
                    child: Text(
                      "Register now!",
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
