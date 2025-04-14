import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movies.dart';

class MoviesState extends Equatable {
  final String errorMessage;
  final RequestStates nowPlayingState;
  final RequestStates popularMoviesState;
  final RequestStates topRatedMoviesState;
  final List<Movies> nowPlayingMovies;
  final List<Movies> topRatedMovies;
  final List<Movies> popularMovies;

  const MoviesState({
    this.errorMessage = "",
    this.popularMoviesState = RequestStates.loading,
    this.topRatedMoviesState = RequestStates.loading,
    this.nowPlayingMovies = const [],
    this.topRatedMovies = const [],
    this.popularMovies = const [],
    this.nowPlayingState = RequestStates.loading,
  });

  MoviesState copyWith({
    String? errorMessage,
     RequestStates? nowPlayingState,
  RequestStates? popularMoviesState,
  RequestStates? topRatedMoviesState,
    List<Movies>? nowPlayingMovies,
    List<Movies>? topRatedMovies,
    List<Movies>? popularMovies,
  }) => MoviesState(
    errorMessage: errorMessage ?? this.errorMessage,
    nowPlayingState: nowPlayingState ?? this.nowPlayingState,
    popularMoviesState: popularMoviesState ?? this.popularMoviesState,
    topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
    nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
    topRatedMovies: topRatedMovies ?? this.topRatedMovies,
    popularMovies: popularMovies ?? this.popularMovies,
  );

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    errorMessage,
    topRatedMovies,
    popularMovies,
  ];
}
