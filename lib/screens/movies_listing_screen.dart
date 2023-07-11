import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';
import '../widgets/movie_card.dart';
import 'movie_detail_screen.dart';

class MoviesListingScreen extends StatefulWidget {
  const MoviesListingScreen({super.key});

  @override
  State<MoviesListingScreen> createState() => _MoviesListingScreenState();
}

class _MoviesListingScreenState extends State<MoviesListingScreen> {
  @override
    void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieProvider>(context, listen: false).fetchMovies();
    });
  }
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'watch',
          style: TextStyle(
            color: Color(0xFF202C43),
          ),
        ),
      ),
      body: movieProvider.isLoading
          ? const CircularProgressIndicator()
          : movieProvider.errorMessage.isNotEmpty
              ? Center(
                  child: Text(movieProvider.errorMessage),
                )
              : ListView.builder(
                  itemCount: movieProvider.movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    final movie = movieProvider.movies[index];
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailScreen(
                                movie: movie,
                              ),
                            ),
                          );
                        },
                        child: MoviesCard(
                          imagePath: movie.posterImagePath,
                          text: movie.title,
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
