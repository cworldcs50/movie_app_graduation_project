import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/custom_widgets/custom_title_row.dart';
import '../components/popular_movies_component.dart';
import '../../../core/services/services_locator.dart';
import '../components/top_rated_movies_component.dart';
import '../controllers/get_movies_bloc/movies_bloc.dart';
import '../components/now_playing_movies_component.dart';
import '../controllers/get_movies_bloc/movies_events.dart';
import 'popular_see_more_screen.dart';
import 'top_rated_see_more_screen.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              sl<MoviesBloc>()
                ..add(GetNowPlayingMoviesEvent())
                ..add(GetPopularMoviesEvent())
                ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const NowPlayingMoviesComponent(),
              CustomTitleRow(
                rowTitle: AppStrings.kPopular,
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PopularSeeMoreScreen(),
                      ),
                    ),
              ),
              const PopularMoviesComponent(),
              CustomTitleRow(
                rowTitle: AppStrings.kTopRated,
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TopRatedSeeMoreScreen(),
                      ),
                    ),
              ),
              const TopRatedMoviesComponent(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * BottomNavigationBar(
          backgroundColor: const Color(0XFF1E1E29),
          selectedIconTheme: const IconThemeData(size: 18),
          elevation: 30,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.movie),
              label: "movies",
              backgroundColor: const Color(0XFF181823),
              activeIcon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.movie),
              ),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: 'TV',
              backgroundColor: Color(0XFF181823),
            ),
          ],
        ),
      
 */
