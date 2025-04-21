import '../../../../core/utils/enums.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';
import '../../../domain/usecases/get_top_rated_movies_usecase.dart';
import 'get_tv_movies_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base_usecases/base_usecase.dart';
import '../../../domain/usecases/get_on_the_air_movies_usecase.dart';
import 'get_tv_movies_states.dart';

class GetTvMoviesBloc extends Bloc<GetTvMoviesEvents, GetTvMoviesStates> {
  GetTvMoviesBloc(
    this.getOnTheAirMoviesUsecase,
    this.getPopularTvMoviesUsecase,
    this.getTopRatedTvMoviesUsecase,
  ) : super(const GetTvMoviesStates()) {
    on<GetOnAirTvMoviesEvent>(_getOnTheAirTvMovies);
    on<GetPopularTvMoviesEvent>(_getPopularTvMovies);
    on<GetTopRatedTvMoviesEvent>(_getTopRatedTvMovies);
  }

  final GetOnTheAirMoviesUsecase getOnTheAirMoviesUsecase;
  final GetPopularTvMoviesUsecase getPopularTvMoviesUsecase;
  final GetTopRatedTvMoviesUsecase getTopRatedTvMoviesUsecase;

  Future<void> _getTopRatedTvMovies(event, emit) async {
    final result = await getTopRatedTvMoviesUsecase(NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          errorMessage: l.errorMessage,
          topRatedTvMoviesRequestState: RequestStates.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedTvMoviesRequestState: RequestStates.loaded,
          topRatedTvMovies: r,
        ),
      ),
    );
  }

  Future<void> _getPopularTvMovies(event, emit) async {
    final result = await getPopularTvMoviesUsecase(NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          errorMessage: l.errorMessage,
          popularTvMoviesRequestState: RequestStates.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularTvMoviesRequestState: RequestStates.loaded,
          popularTvMovies: r,
        ),
      ),
    );
  }

  Future<void> _getOnTheAirTvMovies(event, emit) async {
    final result = await getOnTheAirMoviesUsecase(NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          errorMessage: l.errorMessage,
          onTheAirRequestState: RequestStates.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          onTheAirRequestState: RequestStates.loaded,
          onTheAirTvMovies: r,
        ),
      ),
    );
  }
}
