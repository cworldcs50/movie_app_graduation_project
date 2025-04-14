import 'dart:async';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/movie_details.dart';
import '../../../domain/entities/movies_recommendation.dart';
import '../../../domain/usecases/get_movie_details_usecase.dart';
import '../../../domain/usecases/get_recommended_movies_usecase.dart';
part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc({
    required this.getMovieDetailsUsecase,
    required this.getRecommendedMoviesUsecase,
  }) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendedMoviesEvents>(_getRecommendedMovies);
  }

  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendedMoviesUsecase getRecommendedMoviesUsecase;

  Future<void> _getRecommendedMovies(event, emit) async {
    final result = await getRecommendedMoviesUsecase(
      GetRecommendedMoviesParameters(
        backdropPath: event.backdropPath,
        id: event.id,
      ),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          recommendedMoviesErrorMessage: failure.errorMessage,
          recommendedMoviesState: RequestStates.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendedMovies: r,
          recommendedMoviesState: RequestStates.loaded,
        ),
      ),
    );
  }

  Future<void> _getMovieDetails(event, emit) async {
    final result = await getMovieDetailsUsecase(
      GetMovieDetailsParameters(movieId: event.id),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          movieDetailsErrorMessage: failure.errorMessage,
          movieDetailsState: RequestStates.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestStates.loaded,
        ),
      ),
    );
  }
}
