import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/movie_details.dart';
import '../entities/movies.dart';
import '../entities/movies_recommendation.dart';
import '../usecases/get_movie_details_usecase.dart';
import '../usecases/get_recommended_movies_usecase.dart';

abstract class MoviesBaseRepository {
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movies>>> getPopularMovies();
  Future<Either<Failure, List<Movies>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails({
    required GetMovieDetailsParameters getMovieDetailsParamters,
  });
  Future<Either<Failure, List<MoviesRecommendation>>> getRecommendedMovies(GetRecommendedMoviesParameters parameters);
}
