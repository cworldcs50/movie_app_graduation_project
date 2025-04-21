import 'package:dartz/dartz.dart';
import '../../../core/base_usecases/base_usecase.dart';
import '../../../core/error/failure.dart';
import '../entities/tv_movies.dart';
import '../repository/tv_movies_base_repository.dart';

class GetOnTheAirMoviesUsecase
    extends BaseUsecase<List<TvMovies>, NoParameters> {
  GetOnTheAirMoviesUsecase({required this.tvMoviesBaseRepository});

  final TvMoviesBaseRepository tvMoviesBaseRepository;

  @override
  Future<Either<Failure, List<TvMovies>>> call(NoParameters parameters) async =>
      await tvMoviesBaseRepository.getOnTheAirMovies();
}
