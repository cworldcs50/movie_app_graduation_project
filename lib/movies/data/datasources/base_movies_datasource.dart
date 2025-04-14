import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../domain/usecases/get_recommended_movies_usecase.dart';
import '../models/movie_details_model.dart';
import '../models/movies_model.dart';
import '../models/movies_recommendation_model.dart';

abstract class BaseMoviesDatasource {
  Future<Either<Failure, List<MoviesModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<MoviesModel>>> getPopularMovies();
  Future<Either<Failure, List<MoviesModel>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails({
    required int movieId,
  });
  Future<Either<Failure, List<MoviesRecommendationModel>>> getRecommendedMovies(
    GetRecommendedMoviesParameters parameters,
  );
}
