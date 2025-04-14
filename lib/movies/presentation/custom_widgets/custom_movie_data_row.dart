import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMovieDataRow extends StatelessWidget {
  const CustomMovieDataRow({
    required this.movieDuration,
    required this.releaseYear,
    required this.voteAverage,
    super.key,
  });

  final String releaseYear;
  final num voteAverage;
  final String movieDuration;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Container(
          alignment: Alignment.center,
          width: 50,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(2),
            color: const Color(0XFF424242),
          ),
          child: Text(
            releaseYear,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ),
        Row(
          spacing: 5,
          children: [
            const Icon(Icons.star, color: Color(0XFFFFC107)),
            Text(
              voteAverage.toString(),
              style: GoogleFonts.poppins(fontSize: 12),
            ),
          ],
        ),
        Text(
          movieDuration,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color(0XFFBCBCBF),
          ),
        ),
      ],
    );
  }
}
