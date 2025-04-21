import 'package:equatable/equatable.dart';

class TvMovies extends Equatable {
  final int id;
  final String name;
  final String overview;
  final num voteAverage;
  final String backdropPath;
  final String firstAirDate;

  const TvMovies({
    required this.backdropPath,
    required this.firstAirDate,
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    overview,
    voteAverage,
    backdropPath,
    firstAirDate,
  ];
}
