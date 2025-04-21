import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/tv_movies.dart';

abstract class TvMoviesBaseRepository {
  Future<Either<Failure, List<TvMovies>>> getOnTheAirMovies();
  Future<Either<Failure, List<TvMovies>>> getPopularMovies();
  Future<Either<Failure, List<TvMovies>>> getTopRatedMovies();
}
