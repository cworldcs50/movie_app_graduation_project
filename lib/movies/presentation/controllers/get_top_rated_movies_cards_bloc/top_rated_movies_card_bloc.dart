import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base_usecases/base_usecase.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/usecases/get_top_rated_movies_usecase.dart';
import 'top_rated_movies_card_event.dart';
import 'top_rated_movies_card_states.dart';

class TopRatedMoviesCardBloc
    extends Bloc<GetTopRatedMoviesCardEvent, TopRatedMoviesCardStates> {
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  TopRatedMoviesCardBloc(this.getTopRatedMoviesUsecase)
    : super(const TopRatedMoviesCardStates()) {
    on<GetTopRatedMoviesCardEvent>(_getTopRatedMoviesCard);
  }

  Future<void> _getTopRatedMoviesCard(event, emit) async {
    final result = await getTopRatedMoviesUsecase(NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          errorMessage: l.errorMessage,
          requestStates: RequestStates.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          requestStates: RequestStates.loaded,
          topRatedMoviesCards: r,
        ),
      ),
    );
  }
}
