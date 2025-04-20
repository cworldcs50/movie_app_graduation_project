import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/genres.dart';
import '../../../core/services/services_locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../controllers/movie_details_bloc/movie_details_bloc.dart';
import '../custom_widgets/custom_circular_progress_indicator.dart';
import '../custom_widgets/custom_error_message_widget.dart';
import '../custom_widgets/custom_release_date.dart';
import '../custom_widgets/custom_vote_average_row.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({
    required this.movieId,
    required this.backdropPath,
    super.key,
  });

  final int movieId;
  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              sl<MovieDetailsBloc>()
                ..add(GetMovieDetailsEvent(id: movieId))
                ..add(
                  GetRecommendedMoviesEvents(
                    id: movieId,
                    backdropPath: backdropPath,
                  ),
                ),
      child: const Scaffold(body: MovieDetailsContent()),
    );
  }
}

class MovieDetailsContent extends StatelessWidget {
  const MovieDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestStates.loading:
            return const CustomCircularProgressIndicator(height: 250);
          case RequestStates.error:
            return CustomErrorMessageWidget(
              errorMessage: state.movieDetailsErrorMessage,
            );
          case RequestStates.loaded:
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: ApiConstants.imageUrl(
                            state.movieDetails!.backdropPath!,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.movieDetails!.title,
                            style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              CustomReleaseDate(
                                color: Colors.grey[800]!,
                                releaseDate: state.movieDetails!.releaseDate
                                    .substring(0, 4),
                              ),
                              const SizedBox(width: 16.0),
                              CustomVoteAverageRow(
                                voteAverage: state.movieDetails!.voteAverage
                                    .toStringAsFixed(1),
                              ),
                              const SizedBox(width: 16.0),
                              Text(
                                _showDuration(state.movieDetails!.runtime),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            state.movieDetails!.overview,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Genres: ${_showGenres(state.movieDetails!.genres)}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: const Text(
                        AppStrings.kMoreLikeThis,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver: _showRecommendations(),
                ),
              ],
            );
        }
      },
    );
  }

  String _showDuration(num runtime) {
    int minutes = (runtime % 60).toInt();
    int hours = (runtime - minutes).toInt() ~/ 60;
    return (hours == 0) ? "${minutes}m" : "${hours}h ${minutes}m";
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (Genres genre in genres) {
      result += '${genre.name}, ';
    }

    return result.isEmpty ? result : result.substring(0, result.length - 2);
  }

  Widget _showRecommendations() {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      buildWhen:
          (previous, current) =>
              previous.recommendedMoviesState != current.recommendedMoviesState,
      builder: (context, state) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: state.recommendedMovies.length,
            (context, index) {
              final recommendation = state.recommendedMovies[index];
              return FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: CachedNetworkImage(
                    imageUrl: ApiConstants.imageUrl(
                      recommendation.backdropPath!,
                    ),
                    placeholder:
                        (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            height: 170.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.7,
            crossAxisCount: 3,
          ),
        );
      },
    );
  }
}
