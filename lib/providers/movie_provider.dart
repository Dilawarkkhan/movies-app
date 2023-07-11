import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movie_application/core/env/api_keys.dart';
import 'package:movie_application/core/env/app_url.dart';
import 'package:movie_application/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {
  List<MovieModel> movies = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> fetchMovies() async {
    try {
      isLoading = true;
      notifyListeners();

      // Make the API request to fetch movie data
      final response = await http
          .get(Uri.parse("${AppUrls.movieListUrl}?api_key=${APIKeys.apiKey}"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        movies = List<MovieModel>.from(
          data['results'].map((movie) => MovieModel.fromJson(movie)),
        );
      } else {
        errorMessage = 'Failed to fetch movies. Please try again.';
      }
    } catch (e) {
      errorMessage = 'An error occurred while fetching movies.';
    } finally {
      // Delay the notifyListeners() call to the end of the build phase
      SchedulerBinding.instance.addPostFrameCallback((_) {
        isLoading = false;
        notifyListeners();
      });
    }
  }

  MovieModel? getMovieById(int movieId) {
    try {
      return movies.firstWhere((movie) => movie.id == movieId);
    } catch (e) {
      return null;
    }
  }
}
