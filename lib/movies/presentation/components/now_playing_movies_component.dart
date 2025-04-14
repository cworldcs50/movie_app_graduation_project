import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/utils/enums.dart';
import '../controllers/get_movies_bloc/movies_bloc.dart';
import '../controllers/get_movies_bloc/movies_states.dart';
import '../custom_widgets/custom_circular_progress_indicator.dart';
import '../custom_widgets/custom_error_message_widget.dart';
import '../custom_widgets/custom_now_playing_row_widget.dart';
import '../screens/movie_details_screen.dart';

class NowPlayingMoviesComponent extends StatelessWidget {
  const NowPlayingMoviesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen:
          (previous, current) =>
              previous.nowPlayingState != current.nowPlayingState,
      builder: (context, states) {
        switch (states.nowPlayingState) {
          case RequestStates.loading:
            return CustomCircularProgressIndicator(
              height: MediaQuery.of(context).size.height / 2.0,
            );
          case RequestStates.loaded:
            return FadeIn(
              duration: const Duration(microseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  height: MediaQuery.of(context).size.height / 2.0,
                  viewportFraction: 1.0,
                ),
                items:
                    states.nowPlayingMovies.map((movie) {
                      return GestureDetector(
                        onTap:
                            () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (BuildContext context) =>
                                        MovieDetailsScreen(
                                          movieId: movie.id,
                                          backdropPath: movie.backdropPath,
                                        ),
                              ),
                            ),
                        child: Stack(
                          children: [
                            ShaderMask(
                              blendMode: BlendMode.dstIn,
                              shaderCallback: (bounds) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black,
                                    Colors.black,
                                    Colors.transparent,
                                  ],
                                  stops: [0, 0.3, 0.5, 1],
                                ).createShader(
                                  Rect.fromLTRB(
                                    0,
                                    0,
                                    bounds.width,
                                    bounds.height,
                                  ),
                                );
                              },
                              child: CachedNetworkImage(
                                height: MediaQuery.of(context).size.height,
                                imageUrl: ApiConstants.imageUrl(
                                  movie.backdropPath,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                spacing: 15,
                                children: [
                                  const CustomNowPlayingRowWidget(),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 7),
                                    child: Text(
                                      movie.title,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: MediaQuery.of(
                                          context,
                                        ).textScaler.scale(35),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
              ),
            );
          case RequestStates.error:
            return CustomErrorMessageWidget(errorMessage: states.errorMessage);
        }
      },
    );
  }
}
