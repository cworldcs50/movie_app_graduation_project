class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "d48a880430fe5145c11c86ddf0dde24c";
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=${ApiConstants.apiKey}";
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=${ApiConstants.apiKey}";
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=${ApiConstants.apiKey}";
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static const String topRatedTvMoviesPath = "$baseUrl/tv/top_rated?api_key=$apiKey";
  static String imageUrl(String imagePath) => '$baseImageUrl/$imagePath';

  static String getRecommendedMovies({required int movieId}) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';

  static const String onTheAirTvMovies =
      "$baseUrl/tv/on_the_air?api_key=$apiKey";
  static const String popularTvMoviesPath =
      "$baseUrl/tv/popular?api_key=$apiKey";
  static String getMovieDetails({required int id}) =>
      '$baseUrl/movie/$id?api_key=$apiKey';
}
