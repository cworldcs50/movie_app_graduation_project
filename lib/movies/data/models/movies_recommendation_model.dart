import '../../../core/network/api_constants.dart';
import '../../domain/entities/movies_recommendation.dart';

class MoviesRecommendationModel extends MoviesRecommendation {
  const MoviesRecommendationModel({
    required super.backdropPath,
    required super.id,
  });

  factory MoviesRecommendationModel.fromJson(Map<String, dynamic> jsonData) =>
      MoviesRecommendationModel(
        backdropPath:
            jsonData["backdrop_path"] ??
            ApiConstants.imageUrl("/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg"),
        id: jsonData["id"],
      );
}
