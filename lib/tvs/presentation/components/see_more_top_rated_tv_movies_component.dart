import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/custom_widgets/custom_circular_progress_indicator.dart';
import '../../../core/custom_widgets/custom_error_message_widget.dart';
import '../../../core/custom_widgets/custom_release_date.dart';
import '../../../core/custom_widgets/custom_vote_average_row.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/tv_movies.dart';
import '../controllers/get_tv_movies_bloc/get_tv_movies_bloc.dart';
import '../controllers/get_tv_movies_bloc/get_tv_movies_states.dart';
import '../screens/tv_movies_details_screen.dart';

class SeeMoreTopRatedTvMoviesComponent extends StatelessWidget {
  const SeeMoreTopRatedTvMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTvMoviesBloc, GetTvMoviesStates>(
      buildWhen:
          (previous, current) =>
              previous.topRatedTvMoviesRequestState !=
              current.topRatedTvMoviesRequestState,
      builder: (context, state) {
        switch (state.topRatedTvMoviesRequestState) {
          case RequestStates.loading:
            return const SliverToBoxAdapter(
              child: CustomCircularProgressIndicator(height: 150),
            );
          case RequestStates.error:
            return SliverToBoxAdapter(
              child: CustomErrorMessageWidget(errorMessage: state.errorMessage),
            );
          case RequestStates.loaded:
            return SliverList.separated(
              itemCount: state.topRatedTvMovies.length,
              itemBuilder: (context, index) {
                final TvMovies movie = state.topRatedTvMovies[index];
                return FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: InkWell(
                    onTap:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const TvMoviesDetailsScreen(),
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
                                      const CustomCircularProgressIndicator(
                                        height: 150,
                                      ),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 150,
                              imageUrl: ApiConstants.imageUrl(
                                movie.backdropPath,
                              ),
                              placeholder:
                                  (context, url) => Shimmer.fromColors(
                                    baseColor: Colors.grey[850]!,
                                    highlightColor: Colors.grey[800]!,
                                    child: const SizedBox(
                                      width: 100,
                                      height: 150,
                                    ),
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  movie.name,
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
                                      releaseDate: movie.firstAirDate.substring(
                                        0,
                                        4,
                                      ),
                                    ),
                                    CustomVoteAverageRow(
                                      voteAverage: movie.voteAverage
                                          .toStringAsFixed(1),
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
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            );
        }
      },
    );
  }
}
