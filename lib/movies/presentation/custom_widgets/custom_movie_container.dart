import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/network/api_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../screens/movie_details_screen.dart';

class CustomMovieContainer extends StatelessWidget {
  const CustomMovieContainer({
    required this.imagePath,
    required this.id,
    super.key,
  });

  final String imagePath;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap:
            () => Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => MovieDetailsScreen(
                      backdropPath: imagePath,
                      movieId: id,
                    ),
              ),
            ),
        child: CachedNetworkImage(
          width: 120,
          fit: BoxFit.cover,
          imageUrl: ApiConstants.imageUrl(imagePath),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          placeholder:
              (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[850]!,
                highlightColor: Colors.grey[800]!,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 170,
                  width: 120,
                ),
              ),
        ),
      ),
    );
  }
}
