import 'package:flutter/material.dart';
import 'package:movie_application/screens/user_register_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final controller = TextEditingController();

  @override
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Center(
              child: Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text("Email Address"),
            TextField(
              controller: controller,
            ),
            const SizedBox(
              height: 60,
            ),
            const Text("Password"),
            TextField(
              controller: controller,
            ),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserRegisterScreen()),
                    );
                  },
                  child: const Text("If you Don't have account please Register")),
            )
          ],
        ),
      ),
    );
  }
}
