import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/enums.dart';
import '../controllers/get_top_rated_movies_cards_bloc/top_rated_movies_card_bloc.dart';
import '../controllers/get_top_rated_movies_cards_bloc/top_rated_movies_card_event.dart';
import '../controllers/get_top_rated_movies_cards_bloc/top_rated_movies_card_states.dart';
import '../../../core/custom_widgets/custom_circular_progress_indicator.dart';
import '../../../core/custom_widgets/custom_error_message_widget.dart';
import '../../../core/custom_widgets/custom_movie_card.dart';
import '../../../core/custom_widgets/custom_see_more_sliver_app_bar.dart';

class TopRatedSeeMoreScreen extends StatelessWidget {
  const TopRatedSeeMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              sl<TopRatedMoviesCardBloc>()..add(GetTopRatedMoviesCardEvent()),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(title: "Top Rated Movies"),
            BlocBuilder<TopRatedMoviesCardBloc, TopRatedMoviesCardStates>(
              builder: (context, state) {
                switch (state.requestStates) {
                  case RequestStates.loading:
                    return const SliverToBoxAdapter(
                      child: CustomCircularProgressIndicator(height: 150),
                    );
                  case RequestStates.error:
                    return SliverToBoxAdapter(
                      child: CustomErrorMessageWidget(
                        errorMessage: state.errorMessage,
                      ),
                    );
                  case RequestStates.loaded:
                    return SliverList.separated(
                      itemCount: state.topRatedMoviesCards.length,
                      itemBuilder: (context, index) {
                        return CustomMovieCard(
                          movie: state.topRatedMoviesCards[index],
                        );
                      },
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 10),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
