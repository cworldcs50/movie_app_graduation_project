import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../models/tv_movies_model.dart';

abstract class BaseTvMoviesDataSource {
  Future<Either<Failure, List<TvMoviesModel>>> getOnTheAirTvMovies();
  Future<Either<Failure, List<TvMoviesModel>>> getPopularMovies();
  Future<Either<Failure, List<TvMoviesModel>>> getTopRatedMovies();
}
