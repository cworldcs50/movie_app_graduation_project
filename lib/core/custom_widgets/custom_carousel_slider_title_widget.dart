import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCarouselSliderTitleWidget extends StatelessWidget {
  const CustomCarouselSliderTitleWidget({required this.rowTitle, super.key});

  final String rowTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 5,
      children: [
        Icon(
          Icons.circle,
          color: Colors.red,
          size: MediaQuery.of(context).textScaler.scale(20),
        ),
        Text(
          rowTitle,
          style: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).textScaler.scale(20),

            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
