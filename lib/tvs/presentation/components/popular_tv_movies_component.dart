import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/custom_widgets/custom_circular_progress_indicator.dart';
import '../../../core/custom_widgets/custom_error_message_widget.dart';
import '../../../core/custom_widgets/custom_movie_container.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/tv_movies.dart';
import '../controllers/get_tv_movies_bloc/get_tv_movies_bloc.dart';
import '../controllers/get_tv_movies_bloc/get_tv_movies_states.dart';

class PopularTvMoviesComponent extends StatelessWidget {
  const PopularTvMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTvMoviesBloc, GetTvMoviesStates>(
      buildWhen:
          (previous, current) =>
              previous.popularTvMoviesRequestState !=
              current.popularTvMoviesRequestState,
      builder: (context, state) {
        switch (state.popularTvMoviesRequestState) {
          case RequestStates.loading:
            return const CustomCircularProgressIndicator(height: 170);
          case RequestStates.error:
            return CustomErrorMessageWidget(errorMessage: state.errorMessage);
          case RequestStates.loaded:
            return FadeIn(
              duration: const Duration(microseconds: 500),
              child: SizedBox(
                height: 170,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.popularTvMovies.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 2),
                  itemBuilder: (context, index) {
                    final TvMovies movie = state.popularTvMovies[index];
                    return CustomMovieContainer(
                      id: movie.id,
                      imagePath: movie.backdropPath,
                    );
                  },
                ),
              ),
            );
        }
      },
    );
  }
}
