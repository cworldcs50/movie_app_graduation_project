import 'package:dartz/dartz.dart';
import '../../../core/base_usecases/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entities/movies.dart';
import '../repository/movies_base_repository.dart';

class GetTopRetedMoviesCardsUsecase
    extends BaseUsecase<List<Movies>, NoParameters> {
  final MoviesBaseRepository moviesBaseRepository;

  GetTopRetedMoviesCardsUsecase({required this.moviesBaseRepository});
  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async =>
      await moviesBaseRepository.getTopRatedMoviesCards();
}
