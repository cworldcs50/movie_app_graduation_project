import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/entities/tv_movies.dart';

class GetTvMoviesStates extends Equatable {
  final String errorMessage;
  final RequestStates onTheAirRequestState;
  final List<TvMovies> onTheAirTvMovies;
  final RequestStates popularTvMoviesRequestState;
  final List<TvMovies> popularTvMovies;
  final List<TvMovies> topRatedTvMovies;
  final RequestStates topRatedTvMoviesRequestState;

  const GetTvMoviesStates({
    this.topRatedTvMoviesRequestState = RequestStates.loading,
    this.topRatedTvMovies = const [],
    this.popularTvMoviesRequestState = RequestStates.loading,
    this.popularTvMovies = const [],
    this.errorMessage = "",
    this.onTheAirRequestState = RequestStates.loading,
    this.onTheAirTvMovies = const [],
  });

  GetTvMoviesStates copyWith({
    RequestStates? topRatedTvMoviesRequestState,
    List<TvMovies>? topRatedTvMovies,
    RequestStates? popularTvMoviesRequestState,
    List<TvMovies>? popularTvMovies,
    String? errorMessage,
    RequestStates? onTheAirRequestState,
    List<TvMovies>? onTheAirTvMovies,
  }) => GetTvMoviesStates(
    errorMessage: errorMessage ?? this.errorMessage,
    onTheAirRequestState: onTheAirRequestState ?? this.onTheAirRequestState,
    onTheAirTvMovies: onTheAirTvMovies ?? this.onTheAirTvMovies,
    popularTvMovies: popularTvMovies ?? this.popularTvMovies,
    popularTvMoviesRequestState:
        popularTvMoviesRequestState ?? this.popularTvMoviesRequestState,
    topRatedTvMovies: topRatedTvMovies ?? this.topRatedTvMovies,
    topRatedTvMoviesRequestState:
        topRatedTvMoviesRequestState ?? this.topRatedTvMoviesRequestState,
  );

  @override
  List<Object?> get props => [
    onTheAirRequestState,
    errorMessage,
    onTheAirTvMovies,
    popularTvMoviesRequestState,
    popularTvMovies,
    topRatedTvMovies,
    topRatedTvMoviesRequestState,
  ];
}
