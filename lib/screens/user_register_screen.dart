import 'package:flutter/material.dart';
import 'package:movie_application/screens/sign_in_screen.dart';

class UserRegisterScreen extends StatefulWidget {
  const UserRegisterScreen({super.key});

  @override
  State<UserRegisterScreen> createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  final controller = TextEditingController();
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
                "New User Registration",
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
            const Text("First Name"),
            TextField(
              controller: controller,
            ),
            const SizedBox(
              height: 60,
            ),
            const Text("Second Name"),
            TextField(
              controller: controller,
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
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
                  );
                },
                child: const Text("Enter for Register"),
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                  child:
                      const Text('If you have already account please SignIn')),
            )
          ],
        ),
      ),
    );
  }
}
