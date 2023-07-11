import 'package:flutter/material.dart';

class BottomNavModel {
  final String label;
  final int index;
  final String image;
  final Widget route;

  BottomNavModel({
    required this.label,
    required this.index,
    required this.image,
    required this.route,
  });
}
