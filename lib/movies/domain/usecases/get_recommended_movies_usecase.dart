import 'package:dartz/dartz.dart';
import '../../../core/base_usecases/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entities/movies_recommendation.dart';
import '../repository/movies_base_repository.dart';

class GetRecommendedMoviesUsecase
    extends
        BaseUsecase<
          List<MoviesRecommendation>,
          GetRecommendedMoviesParameters
        > {
  final MoviesBaseRepository moviesBaseRepository;

  GetRecommendedMoviesUsecase({required this.moviesBaseRepository});

  @override
  Future<Either<Failure, List<MoviesRecommendation>>> call(
    GetRecommendedMoviesParameters parameters,
  ) async => await moviesBaseRepository.getRecommendedMovies(parameters);
}

class GetRecommendedMoviesParameters {
  final int id;
  final String backdropPath;

  const GetRecommendedMoviesParameters({
    required this.backdropPath,
    required this.id,
  });
}
