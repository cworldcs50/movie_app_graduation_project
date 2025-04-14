import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/base_usecases/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entities/movie_details.dart';
import '../repository/movies_base_repository.dart';

class GetMovieDetailsUsecase
    extends BaseUsecase<MovieDetails, GetMovieDetailsParameters> {
  final MoviesBaseRepository moviesBaseRepository;

  GetMovieDetailsUsecase({required this.moviesBaseRepository});

  @override
  Future<Either<Failure, MovieDetails>> call(
    GetMovieDetailsParameters parameters,
  ) async => await moviesBaseRepository.getMovieDetails(
    getMovieDetailsParamters: GetMovieDetailsParameters(
      movieId: parameters.movieId,
    ),
  );
}

class GetMovieDetailsParameters extends Equatable {
  final int movieId;

  const GetMovieDetailsParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
