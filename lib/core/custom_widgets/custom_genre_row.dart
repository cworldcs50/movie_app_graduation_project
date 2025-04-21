import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_strings.dart';
import '../utils/dummy_for_movie_details.dart';

class CustomGenresRow extends StatelessWidget {
  const CustomGenresRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Text(
          AppStrings.kGenres,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0XFFBCBCBF),
          ),
        ),
        for (int i = 0; i < movieDetailDummy.genres.length; i++)
          Text(
            "${movieDetailDummy.genres[i].name}${i < movieDetailDummy.genres.length - 1 ? "," : ""}",
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0XFFBCBCBF),
            ),
          ),
      ],
    );
  }
}
