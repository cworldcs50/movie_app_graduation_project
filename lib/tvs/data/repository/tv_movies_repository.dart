import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/tv_movies.dart';
import '../../domain/repository/tv_movies_base_repository.dart';
import '../datasources/base_tv_movies_data_source.dart';

class TvMoviesRepository extends TvMoviesBaseRepository {
  final BaseTvMoviesDataSource baseTvMoviesDataSource;

  TvMoviesRepository({required this.baseTvMoviesDataSource});

  @override
  Future<Either<Failure, List<TvMovies>>> getOnTheAirMovies() async =>
      await baseTvMoviesDataSource.getOnTheAirTvMovies();

  @override
  Future<Either<Failure, List<TvMovies>>> getPopularMovies() async =>
      await baseTvMoviesDataSource.getPopularMovies();

  @override
  Future<Either<Failure, List<TvMovies>>> getTopRatedMovies() async =>
      await baseTvMoviesDataSource.getTopRatedMovies();
}
