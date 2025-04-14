import 'package:get_it/get_it.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/data/datasources/base_movies_datasource.dart';
import '../../movies/domain/repository/movies_base_repository.dart';
import '../../movies/domain/usecases/get_movie_details_usecase.dart';
import '../../movies/data/datasources/remote_movies_datasource.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../movies/domain/usecases/get_recommended_movies_usecase.dart';
import '../../movies/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../movies/presentation/controllers/get_movies_bloc/movies_bloc.dart';
import '../../movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //Bloc
    sl.registerFactory<MoviesBloc>(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory<MovieDetailsBloc>(
      () => MovieDetailsBloc(
        getRecommendedMoviesUsecase: sl(),
        getMovieDetailsUsecase: sl(),
      ),
    );

    //usecases
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
    sl.registerLazySingleton<MoviesBaseRepository>(
      () => MoviesRepository(baseMoviesDatasource: sl()),
    );

    ///datasource
    sl.registerLazySingleton<BaseMoviesDatasource>(
      () => RemoteMoviesDatasource(),
    );
  }
}
