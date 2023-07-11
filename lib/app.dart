import 'package:flutter/material.dart';
import 'package:movie_application/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'core/app_providers.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: const MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}