import 'package:flutter/material.dart';

class ShapesContainer extends StatefulWidget {
  final String text;
  final Color shapeColor;
  const ShapesContainer(
      {super.key, required this.text, required this.shapeColor});

  @override
  State<ShapesContainer> createState() => _ShapesContainerState();
}

class _ShapesContainerState extends State<ShapesContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: widget.shapeColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          widget.text,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
