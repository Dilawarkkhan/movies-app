import 'package:flutter/material.dart';
import 'package:movie_application/providers/bottom_navigation_provider.dart';
import 'package:movie_application/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigationProvider
          .items[context.watch<BottomNavigationProvider>().selectedIndex].route,
      bottomNavigationBar: const BottomBar(),
    );
  }
}
