import 'package:flutter/material.dart';
import 'package:movie_application/core/app_validator.dart';
import 'package:movie_application/providers/authentication_provider.dart';
import 'package:movie_application/screens/login_screen.dart';
import 'package:movie_application/screens/navigation_screen.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // ===========================================================================
  // Text Editing Controllers
  // ===========================================================================
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;

  // ===========================================================================
  // Form Key
  // ===========================================================================
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ===========================================================================
  // Init State
  // ===========================================================================
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    super.initState();
  }

  // ===========================================================================
  // Dispose
  // ===========================================================================
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  // ===========================================================================
  // Build
  // ===========================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _firstNameController,
                    decoration:
                        const InputDecoration(label: Text('First Name')),
                    validator: AppValidator.isEmpty,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(label: Text('Last Name')),
                    validator: AppValidator.isEmpty,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _emailController,
                    decoration:
                        const InputDecoration(label: Text('Email Address')),
                    validator: AppValidator.isEmailValid,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(label: Text('Password')),
                    validator: AppValidator.isEmpty,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _registerUser,
                child: context.watch<AuthenticationProvider>().isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Register"),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text('If you have already account please SignIn'),
              ),
            )
          ],
        ),
      ),
    );
  }

  _registerUser() async {
    // If form is completely validated, then Register
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "email": _emailController.text.trim(),
        "password": _passwordController.text.trim(),
        "firstName": _firstNameController.text.trim(),
        "lastName": _lastNameController.text.trim(),
      };
      bool successful =
          await context.read<AuthenticationProvider>().register(data);
      if (!mounted) return;
      if (successful) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const NavigationScreen(),
            ),
            (route) => false);
      }
    }
  }
}
