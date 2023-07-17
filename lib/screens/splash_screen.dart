import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_application/core/assets.dart';
import 'package:movie_application/core/user_preferences.dart';
import 'package:movie_application/screens/login_screen.dart';
import 'package:movie_application/screens/navigation_screen.dart';
import 'package:movie_application/screens/register_screen.dart';
import 'package:provider/provider.dart';

import '../providers/authentication_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  bool isUserLoggedIN = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<AuthenticationProvider>().getUserData());

    timer = Timer(
      const Duration(seconds: 3),
      () {
        if (isUserLoggedIN) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder
            
            
            
            
            
            
            
            
            
            
            
            : (context) => const NavigationScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const RegisterScreen()),
        // );
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isUserLoggedIN = context.watch<AuthenticationProvider>().isLoggedIn;

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 250,
          child: Image.asset(
            AppAssets.movieIcon,
          ),
        ),
      ),
    );
  }
}
