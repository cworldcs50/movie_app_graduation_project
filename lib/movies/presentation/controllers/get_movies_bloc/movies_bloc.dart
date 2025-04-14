import 'package:dartz/dartz.dart';
import '../../../../core/base_usecases/base_usecase.dart';
import '../../../../core/error/failure.dart';
import '../../../domain/entities/movies.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';
import '../../../domain/usecases/get_top_rated_movies_usecase.dart';
import 'movies_states.dart';
import 'movies_events.dart';
import '../../../../core/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_now_playing_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MoviesBloc(
    this.getNowPlayingMoviesUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  Future<void> _getNowPlayingMovies(event, emit) async {
    final Either<Failure, List<Movies>> result =
        await getNowPlayingMoviesUsecase(NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestStates.error,
          errorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestStates.loaded,
        ),
      ),
    );
  }

  Future<void> _getPopularMovies(event, emit) async {
    final Either<Failure, List<Movies>> result =
        await getPopularMoviesUsecase(NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          popularMoviesState: RequestStates.error,
          errorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularMoviesState: RequestStates.loaded,
        ),
      ),
    );
  }

  Future<void> _getTopRatedMovies(event, emit) async {
    final Either<Failure, List<Movies>> result =
        await getTopRatedMoviesUsecase(NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedMoviesState: RequestStates.error,
          errorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedMoviesState: RequestStates.loaded,
        ),
      ),
    );
  }
}
