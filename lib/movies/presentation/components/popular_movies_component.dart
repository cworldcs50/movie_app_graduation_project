import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/movies.dart';
import '../controllers/get_movies_bloc/movies_bloc.dart';
import '../controllers/get_movies_bloc/movies_states.dart';
import '../custom_widgets/custom_circular_progress_indicator.dart';
import '../custom_widgets/custom_error_message_widget.dart';
import '../custom_widgets/custom_movie_container.dart';

class PopularMoviesComponent extends StatelessWidget {
  const PopularMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen:
          (previous, current) =>
              previous.popularMoviesState != current.popularMoviesState,
      builder: (context, states) {
        switch (states.popularMoviesState) {
          case RequestStates.loading:
            return const CustomCircularProgressIndicator(height: 170);
          case RequestStates.loaded:
            return FadeIn(
              duration: const Duration(microseconds: 500),
              child: SizedBox(
                height: 170,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: states.popularMovies.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 2),
                  itemBuilder: (context, index) {
                    final Movies movie = states.popularMovies[index];
                    return CustomMovieContainer(
                      id: movie.id,
                      imagePath: movie.backdropPath,
                    );
                  },
                ),
              ),
            );
          case RequestStates.error:
            return CustomErrorMessageWidget(errorMessage: states.errorMessage);
        }
      },
    );
  }
}
