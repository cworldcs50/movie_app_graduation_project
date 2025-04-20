import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movies.dart';

class TopRatedMoviesCardStates extends Equatable {
  final RequestStates requestStates;
  final List<Movies> topRatedMoviesCards;
  final String errorMessage;

  const TopRatedMoviesCardStates({
    this.topRatedMoviesCards = const [],
    this.requestStates = RequestStates.loading,
    this.errorMessage = "",
  });

  TopRatedMoviesCardStates copyWith({
    RequestStates? requestStates,
    List<Movies>? topRatedMoviesCards,
    String? errorMessage,
  }) => TopRatedMoviesCardStates(
    errorMessage: errorMessage ?? this.errorMessage,
    topRatedMoviesCards: topRatedMoviesCards ?? this.topRatedMoviesCards,
    requestStates: requestStates ?? this.requestStates,
  );

  @override
  List<Object?> get props => [requestStates, topRatedMoviesCards, errorMessage];
}
