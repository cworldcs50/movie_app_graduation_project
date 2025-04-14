import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_strings.dart';
import '../custom_widgets/custom_title_row.dart';
import '../components/popular_movies_component.dart';
import '../../../core/services/services_locator.dart';
import '../components/top_rated_movies_component.dart';
import '../controllers/get_movies_bloc/movies_bloc.dart';
import '../components/now_playing_movies_component.dart';
import '../controllers/get_movies_bloc/movies_events.dart';

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
        body: const SingleChildScrollView(
          child: Column(
            children: [
              NowPlayingMoviesComponent(),
              CustomTitleRow(rowTitle: AppStrings.kPopular),
              PopularMoviesComponent(),
              CustomTitleRow(rowTitle: AppStrings.kTopRated),
              TopRatedMoviesComponent(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
