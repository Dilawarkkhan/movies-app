import 'package:flutter/material.dart';
import 'package:movie_application/model/movie_model.dart';
import 'package:movie_application/widgets/movie_overview.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final movieProvider = Provider.of<MovieProvider>(context);
    // final movie = movieProvider.getMovieById(movieId)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieOverviewWidget(
              imagePath: movie.backdropImagePath,
              overview: movie.overview,
              genre: movie.genre,
              releaseDate: movie.releaseDate,
              title: movie.title,
            ),
          ],
        ),
      ),
    );
  }
}
