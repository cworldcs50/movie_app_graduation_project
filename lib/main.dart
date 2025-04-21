import 'package:flutter/material.dart';
import 'core/services/services_locator.dart';
import 'core/utils/app_strings.dart';
// import 'movies/presentation/screens/movie_screen.dart';
import 'tvs/presentation/screens/tv_movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: AppStrings.kAppName,
      home: const TvMoviesScreen(),
    );
  }
}
