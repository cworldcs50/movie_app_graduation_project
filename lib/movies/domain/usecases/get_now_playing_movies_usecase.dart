import 'package:dartz/dartz.dart';
import '../../../core/base_usecases/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entities/movies.dart';
import '../repository/movies_base_repository.dart';

class GetNowPlayingMoviesUsecase
    extends BaseUsecase<List<Movies>, NoParameters> {
  final MoviesBaseRepository moviesBaseRepository;

  GetNowPlayingMoviesUsecase({required this.moviesBaseRepository});

  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters noParameters) async =>
      await moviesBaseRepository.getNowPlayingMovies();
}
