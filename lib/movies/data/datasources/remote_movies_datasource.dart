import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/api.dart';
import '../../../core/network/api_constants.dart';
import '../../domain/usecases/get_recommended_movies_usecase.dart';
import '../models/movie_details_model.dart';
import '../models/movies_model.dart';
import '../models/movies_recommendation_model.dart';
import 'base_movies_datasource.dart';
import 'package:dartz/dartz.dart';

class RemoteMoviesDatasource extends BaseMoviesDatasource {
  @override
  Future<Either<Failure, List<MoviesModel>>> getNowPlayingMovies() async {
    try {
      dynamic data = await Api().get(url: ApiConstants.nowPlayingMoviesPath);

      List<MoviesModel> nowPlayingMovies = List<MoviesModel>.from(
        (data['results'] as List).map((result) => MoviesModel.fromJson(result)),
      );

      return Right(nowPlayingMovies);
    } on ServerException catch (serverException) {
      return Left(
        ServerFailure(errorMessage: serverException.errorModel.statusMessage),
      );
    } catch (exception) {
      return Left(Failure(errorMessage: exception.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getPopularMovies() async {
    try {
      dynamic data = await Api().get(url: ApiConstants.popularMoviesPath);

      List<MoviesModel> popularMovies = List<MoviesModel>.from(
        (data['results'] as List).map((result) => MoviesModel.fromJson(result)),
      );

      return Right(popularMovies);
    } on ServerException catch (serverException) {
      return Left(
        ServerFailure(errorMessage: serverException.errorModel.statusMessage),
      );
    } catch (exception) {
      return Left(Failure(errorMessage: exception.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getTopRatedMovies() async {
    try {
      dynamic data = await Api().get(url: ApiConstants.topRatedMoviesPath);

      List<MoviesModel> topRatedMovies = List<MoviesModel>.from(
        (data['results'] as List).map((result) => MoviesModel.fromJson(result)),
      );

      return Right(topRatedMovies);
    } on ServerException catch (serverException) {
      return Left(
        ServerFailure(errorMessage: serverException.errorModel.statusMessage),
      );
    } catch (exception) {
      return Left(Failure(errorMessage: exception.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails({
    required int movieId,
  }) async {
    try {
      dynamic data = await Api().get(
        url: ApiConstants.getMovieDetails(id: movieId),
      );

      MovieDetailsModel movieDetailsModel = MovieDetailsModel.fromJson(data);

      return Right(movieDetailsModel);
    } on ServerException catch (serverException) {
      return Left(
        ServerFailure(errorMessage: serverException.errorModel.statusMessage),
      );
    } catch (exception) {
      return Left(Failure(errorMessage: exception.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoviesRecommendationModel>>> getRecommendedMovies(
    GetRecommendedMoviesParameters parameters,
  ) async {
    try {
      dynamic data = await Api().get(
        url: ApiConstants.getRecommendedMovies(movieId: parameters.id),
      );

      final List<MoviesRecommendationModel> recommendedMovies =
          List<MoviesRecommendationModel>.from(
            (data['results'] as List).map(
              (movie) => MoviesRecommendationModel.fromJson(movie),
            ),
          );

      return Right(recommendedMovies);
    } on ServerException catch (serverException) {
      return Left(
        ServerFailure(errorMessage: serverException.errorModel.statusMessage),
      );
    } catch (exception) {
      return Left(Failure(errorMessage: exception.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MoviesModel>>> getPopularMoviesCards() async =>
      await getPopularMovies();

  @override
  Future<Either<Failure, List<MoviesModel>>> getTopRatedMoviesCards() async =>
      await getTopRatedMovies();
}
