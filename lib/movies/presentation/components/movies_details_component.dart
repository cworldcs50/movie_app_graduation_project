import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/network/api_constants.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/genres.dart';
import '../controllers/movie_details_bloc/movie_details_bloc.dart';
import '../../../core/custom_widgets/custom_circular_progress_indicator.dart';
import '../../../core/custom_widgets/custom_error_message_widget.dart';

class MoviesDetailsComponent extends StatelessWidget {
  const MoviesDetailsComponent({super.key});

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
            return SliverList(
              delegate: SliverChildListDelegate([
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
                            Rect.fromLTRB(0, 0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: ApiConstants.imageUrl(
                            state.movieDetails!.backdropPath ??
                                "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                FadeInUp(
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
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.0,
                                horizontal: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                state.movieDetails!.releaseDate.substring(0, 4),
                                style: GoogleFonts.poppins(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20.0,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  ((state.movieDetails!.voteAverage)
                                      .toStringAsFixed(1)),
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  '(${state.movieDetails!.voteAverage})',
                                  style: GoogleFonts.poppins(
                                    fontSize: 1.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16.0),
                            Text(
                              _showDuration(state.movieDetails!.runtime),
                              style: GoogleFonts.poppins(
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
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '${AppStrings.kGenres} ${_showGenres(state.movieDetails!.genres)}',
                          style: GoogleFonts.poppins(
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
              ]),
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
}
