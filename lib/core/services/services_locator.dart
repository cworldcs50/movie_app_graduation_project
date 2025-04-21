import 'package:get_it/get_it.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/data/datasources/base_movies_datasource.dart';
import '../../movies/domain/repository/movies_base_repository.dart';
import '../../movies/domain/usecases/get_movie_details_usecase.dart';
import '../../movies/data/datasources/remote_movies_datasource.dart';
import '../../movies/domain/usecases/get_popular_movies_cards_usecase.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../movies/domain/usecases/get_recommended_movies_usecase.dart';
import '../../movies/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../movies/domain/usecases/get_top_reted_movies_cards_usecase.dart';
import '../../movies/presentation/controllers/get_movies_bloc/movies_bloc.dart';
import '../../movies/presentation/controllers/get_popular_movies_cards_bloc/popular_movies_card_bloc.dart';
import '../../movies/presentation/controllers/get_top_rated_movies_cards_bloc/top_rated_movies_card_bloc.dart';
import '../../movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import '../../tvs/data/datasources/base_tv_movies_data_source.dart';
import '../../tvs/data/datasources/tv_movies_data_source.dart';
import '../../tvs/data/repository/tv_movies_repository.dart';
import '../../tvs/domain/repository/tv_movies_base_repository.dart';
import '../../tvs/domain/usecases/get_on_the_air_movies_usecase.dart';
import '../../tvs/domain/usecases/get_popular_movies_usecase.dart';
import '../../tvs/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../tvs/presentation/controllers/get_tv_movies_bloc/get_tv_movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //Bloc
    sl.registerFactory<GetTvMoviesBloc>(
      () => GetTvMoviesBloc(sl(), sl(), sl()),
    );

    sl.registerFactory<TopRatedMoviesCardBloc>(
      () => TopRatedMoviesCardBloc(sl()),
    );

    sl.registerFactory<PopularMoviesCardBloc>(
      () => PopularMoviesCardBloc(getPopularMoviesCardsUsecase: sl()),
    );

    sl.registerFactory<MoviesBloc>(() => MoviesBloc(sl(), sl(), sl()));

    sl.registerFactory<MovieDetailsBloc>(
      () => MovieDetailsBloc(
        getRecommendedMoviesUsecase: sl(),
        getMovieDetailsUsecase: sl(),
      ),
    );

    //usecases
    sl.registerLazySingleton<GetTopRatedTvMoviesUsecase>(
      () => GetTopRatedTvMoviesUsecase(tvMoviesBaseRepository: sl()),
    );
    
    sl.registerLazySingleton<GetPopularTvMoviesUsecase>(
      () => GetPopularTvMoviesUsecase(tvMoviesBaseRepository: sl()),
    );

    sl.registerLazySingleton<GetOnTheAirMoviesUsecase>(
      () => GetOnTheAirMoviesUsecase(tvMoviesBaseRepository: sl()),
    );

    sl.registerLazySingleton<GetTopRetedMoviesCardsUsecase>(
      () => GetTopRetedMoviesCardsUsecase(moviesBaseRepository: sl()),
    );
    sl.registerLazySingleton<GetPopularMoviesCardsUsecase>(
      () => GetPopularMoviesCardsUsecase(moviesBaseRepository: sl()),
    );
    sl.registerLazySingleton<GetRecommendedMoviesUsecase>(
      () => GetRecommendedMoviesUsecase(moviesBaseRepository: sl()),
    );

    sl.registerLazySingleton<GetMovieDetailsUsecase>(
      () => GetMovieDetailsUsecase(moviesBaseRepository: sl()),
    );

    sl.registerLazySingleton<GetNowPlayingMoviesUsecase>(
      () => GetNowPlayingMoviesUsecase(moviesBaseRepository: sl()),
    );

    sl.registerLazySingleton<GetPopularMoviesUsecase>(
      () => GetPopularMoviesUsecase(moviesBaseRepository: sl()),
    );

    sl.registerLazySingleton<GetTopRatedMoviesUsecase>(
      () => GetTopRatedMoviesUsecase(moviesBaseRepository: sl()),
    );

    ///repository
    sl.registerLazySingleton<TvMoviesBaseRepository>(
      () => TvMoviesRepository(baseTvMoviesDataSource: sl()),
    );

    sl.registerLazySingleton<MoviesBaseRepository>(
      () => MoviesRepository(baseMoviesDatasource: sl()),
    );

    ///datasource
    sl.registerLazySingleton<BaseTvMoviesDataSource>(
      () => TvMoviesDataSource(),
    );

    sl.registerLazySingleton<BaseMoviesDatasource>(
      () => RemoteMoviesDatasource(),
    );
  }
}
