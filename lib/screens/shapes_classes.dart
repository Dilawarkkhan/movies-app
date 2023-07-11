import 'package:flutter/material.dart';
import 'package:movie_application/widgets/shapes.dart';

class CustomeShape extends StatelessWidget {
  const CustomeShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShapesContainer(
            text: "Action", shapeColor: Color.fromARGB(255, 109, 205, 240)),
        ShapesContainer(
            text: "Thriller", shapeColor: Color.fromARGB(255, 236, 47, 195)),
        ShapesContainer(
            text: "Science", shapeColor: Color.fromARGB(255, 56, 56, 202)),
        ShapesContainer(
            text: "Fiction", shapeColor: Color.fromARGB(255, 187, 171, 30)),
      ],
    );
  }
}
