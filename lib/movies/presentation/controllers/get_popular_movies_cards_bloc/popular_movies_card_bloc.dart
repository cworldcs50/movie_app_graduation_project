import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base_usecases/base_usecase.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/usecases/get_popular_movies_cards_usecase.dart';
import 'popular_movies_card_event.dart';
import 'popular_movies_card_states.dart';

class PopularMoviesCardBloc
    extends Bloc<GetPopularMoviesCardEvent, PopularMoviesCardStates> {
  final GetPopularMoviesCardsUsecase getPopularMoviesCardsUsecase;
  PopularMoviesCardBloc({required this.getPopularMoviesCardsUsecase})
    : super(const PopularMoviesCardStates()) {
    on<GetPopularMoviesCardEvent>(_getPopularMoviesCards);
  }

  Future<void> _getPopularMoviesCards(event, emit) async {
    final result = await getPopularMoviesCardsUsecase(NoParameters());

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
          popularMoviesCards: r,
        ),
      ),
    );
  }
}
