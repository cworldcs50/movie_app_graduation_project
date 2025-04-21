import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/custom_widgets/custom_title_row.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/app_strings.dart';
import '../../../movies/presentation/screens/popular_see_more_screen.dart';
import '../components/on_the_air_tv_movies_component.dart';
import '../components/popular_tv_movies_component.dart';
import '../components/top_rated_tv_movies_component.dart';
import '../controllers/get_tv_movies_bloc/get_tv_movies_bloc.dart';
import '../controllers/get_tv_movies_bloc/get_tv_movies_event.dart';

class TvMoviesScreen extends StatelessWidget {
  const TvMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              sl<GetTvMoviesBloc>()
                ..add(GetOnAirTvMoviesEvent())
                ..add(GetPopularTvMoviesEvent())
                ..add(GetTopRatedTvMoviesEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const OnTheAirComponent(),
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

              const PopularTvMoviesComponent(),
              CustomTitleRow(
                rowTitle: AppStrings.kTopRated,
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PopularSeeMoreScreen(),
                      ),
                    ),
              ),
              const TopRatedTvMoviesComponent(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
