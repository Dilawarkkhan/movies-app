import 'package:flutter/material.dart';
import 'package:movie_application/screens/shapes_classes.dart';

class MovieOverviewWidget extends StatelessWidget {
  final String imagePath;
  final String overview;
  final String genre;
  final String releaseDate;
  final String title;

  const MovieOverviewWidget({
    Key? key,
    required this.imagePath,
    required this.overview,
    required this.genre,
    required this.releaseDate,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 359,
        ),
        Positioned(
          top: 300,
          left: 10,
          child: Text(
            releaseDate,
            style: const TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 375),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomeShape()),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Overview',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  overview,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
