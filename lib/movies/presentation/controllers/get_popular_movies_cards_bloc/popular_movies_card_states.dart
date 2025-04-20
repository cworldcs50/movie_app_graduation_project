import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movies.dart';

class PopularMoviesCardStates extends Equatable {
  final RequestStates requestStates;
  final List<Movies> popularMoviesCards;
  final String errorMessage;

  const PopularMoviesCardStates({
    this.popularMoviesCards = const [],
    this.requestStates = RequestStates.loading,
    this.errorMessage = "",
  });

  PopularMoviesCardStates copyWith({
    RequestStates? requestStates,
    List<Movies>? popularMoviesCards,
    String? errorMessage,
  }) => PopularMoviesCardStates(
    errorMessage: errorMessage ?? this.errorMessage,
    popularMoviesCards: popularMoviesCards ?? this.popularMoviesCards,
    requestStates: requestStates ?? this.requestStates,
  );

  @override
  List<Object?> get props => [requestStates, popularMoviesCards, errorMessage];
}
