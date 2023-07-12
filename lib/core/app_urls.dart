import 'package:movie_application/core/env/environment_variables.dart';

class AppUrls {
  /// Movies Listing URL (from tmdb)
  static const String movieListUrl =
      "${EnvironmentVariables.moviesBaseURL}/3/movie/popular";

  /// Register User to Shopify and internal
  static const String registerUserURL =
      '${EnvironmentVariables.baseURL}/api/users/signupShopify';

  /// Login User to Shopify and internal
  static const String loginUserURL =
      '${EnvironmentVariables.baseURL}/api/users/loginShopify';
}
