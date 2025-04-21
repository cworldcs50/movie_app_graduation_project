import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../network/api_constants.dart';
import '../../movies/domain/entities/movies.dart';
import '../../movies/presentation/screens/movie_details_screen.dart';
import 'custom_circular_progress_indicator.dart';
import 'custom_release_date.dart';
import 'custom_vote_average_row.dart';

class CustomMovieCard extends StatelessWidget {
  const CustomMovieCard({required this.movie, super.key});

  final Movies movie;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: InkWell(
        onTap:
            () => Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => MovieDetailsScreen(
                      backdropPath: movie.backdropPath,
                      movieId: movie.id,
                    ),
              ),
            ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0XFF303030),
          ),
          child: Row(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  errorWidget:
                      (context, url, error) =>
                          const CustomCircularProgressIndicator(height: 150),
                  fit: BoxFit.cover,
                  width: 100,
                  height: 150,
                  imageUrl: ApiConstants.imageUrl(movie.backdropPath),
                  placeholder:
                      (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: const SizedBox(width: 100, height: 150),
                      ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      spacing: 15,
                      children: [
                        CustomReleaseDate(
                          color: Colors.red,
                          releaseDate: movie.releaseDate.substring(0, 4),
                        ),
                        CustomVoteAverageRow(
                          voteAverage: movie.voteAverage.toStringAsFixed(1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      movie.overview,
                      maxLines: 2,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
