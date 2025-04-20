import 'package:flutter/widgets.dart';
import '../custom_widgets/custom_movie_card.dart';

class PopularMoviesCardsComponent extends StatelessWidget {
  const PopularMoviesCardsComponent({
    required this.length,
    required this.moviesCard,
    super.key,
  });

  final int length;
  final List<CustomMovieCard> moviesCard;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) => moviesCard[index],
    );
  }
}
