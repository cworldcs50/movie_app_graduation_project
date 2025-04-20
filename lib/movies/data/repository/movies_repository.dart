import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/movies.dart';
import '../../domain/repository/movies_base_repository.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommended_movies_usecase.dart';
import '../datasources/base_movies_datasource.dart';
import '../models/movies_recommendation_model.dart';

class MoviesRepository implements MoviesBaseRepository {
  final BaseMoviesDatasource baseMoviesDatasource;

  const MoviesRepository({required this.baseMoviesDatasource});

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async =>
      await baseMoviesDatasource.getNowPlayingMovies();

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async =>
      await baseMoviesDatasource.getPopularMovies();

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async =>
      await baseMoviesDatasource.getTopRatedMovies();

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails({
    required GetMovieDetailsParameters getMovieDetailsParamters,
  }) async => await baseMoviesDatasource.getMovieDetails(
    movieId: getMovieDetailsParamters.movieId,
  );

  @override
  Future<Either<Failure, List<MoviesRecommendationModel>>> getRecommendedMovies(
    GetRecommendedMoviesParameters parameters,
  ) async => await baseMoviesDatasource.getRecommendedMovies(parameters);

  @override
  Future<Either<Failure, List<Movies>>> getPopularMoviesCards() async =>
      await baseMoviesDatasource.getPopularMoviesCards();

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMoviesCards() async =>
      await baseMoviesDatasource.getTopRatedMoviesCards();
}
