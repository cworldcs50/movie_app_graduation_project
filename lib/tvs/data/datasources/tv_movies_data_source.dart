import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/api.dart';
import '../../../core/network/api_constants.dart';
import '../models/tv_movies_model.dart';
import 'base_tv_movies_data_source.dart';

class TvMoviesDataSource extends BaseTvMoviesDataSource {
  @override
  Future<Either<Failure, List<TvMoviesModel>>> getOnTheAirTvMovies() async {
    try {
      dynamic data = await Api().get(url: ApiConstants.onTheAirTvMovies);

      final List<TvMoviesModel> tvMovies = List<TvMoviesModel>.from(
        (data['results'] as List).map(
          (tvMovie) => TvMoviesModel.fromJson(tvMovie),
        ),
      );

      return Right(tvMovies);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TvMoviesModel>>> getPopularMovies() async {
    try {
      dynamic data = await Api().get(url: ApiConstants.popularTvMoviesPath);

      final List<TvMoviesModel> tvMovies = List<TvMoviesModel>.from(
        (data['results'] as List).map(
          (tvMovie) => TvMoviesModel.fromJson(tvMovie),
        ),
      );

      return Right(tvMovies);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TvMoviesModel>>> getTopRatedMovies() async {
    try {
      dynamic data = await Api().get(url: ApiConstants.topRatedTvMoviesPath);

      final List<TvMoviesModel> tvMovies = List<TvMoviesModel>.from(
        (data['results'] as List).map(
          (tvMovie) => TvMoviesModel.fromJson(tvMovie),
        ),
      );

      return Right(tvMovies);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
