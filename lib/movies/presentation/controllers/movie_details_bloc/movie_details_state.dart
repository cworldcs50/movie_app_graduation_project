part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestStates movieDetailsState;
  final String movieDetailsErrorMessage;
  final String recommendedMoviesErrorMessage;
  final RequestStates recommendedMoviesState;
  final List<MoviesRecommendation> recommendedMovies;

  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsErrorMessage = "",
    this.recommendedMoviesErrorMessage = "",
    this.recommendedMovies = const [],
    this.movieDetailsState = RequestStates.loading,
    this.recommendedMoviesState = RequestStates.loading,
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestStates? movieDetailsState,
    String? movieDetailsErrorMessage,
    RequestStates? recommendedMoviesState,
    List<MoviesRecommendation>? recommendedMovies,
    String? recommendedMoviesErrorMessage,
  }) => MovieDetailsState(
    movieDetailsErrorMessage:
        movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
    movieDetails: movieDetails ?? this.movieDetails,
    movieDetailsState: movieDetailsState ?? this.movieDetailsState,
    recommendedMoviesState:
        recommendedMoviesState ?? this.recommendedMoviesState,
    recommendedMovies: recommendedMovies ?? this.recommendedMovies,
    recommendedMoviesErrorMessage:
        recommendedMoviesErrorMessage ?? this.recommendedMoviesErrorMessage,
  );

  @override
  List<Object?> get props => [
    movieDetails,
    movieDetailsState,
    movieDetailsErrorMessage,
    recommendedMovies,
    recommendedMoviesState,
    recommendedMoviesErrorMessage,
  ];
}
