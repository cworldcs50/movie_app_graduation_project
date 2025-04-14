part of 'movie_details_bloc.dart';

class MovieDetailsEvent extends Equatable {
  final int id;

  const MovieDetailsEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  const GetMovieDetailsEvent({required super.id});
}

class GetRecommendedMoviesEvents extends MovieDetailsEvent {
  const GetRecommendedMoviesEvents({
    required super.id,
    required this.backdropPath,
  });

  final String backdropPath;

  @override
  List<Object?> get props => [super.id, backdropPath];
}
