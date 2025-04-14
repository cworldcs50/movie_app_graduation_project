import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/app_strings.dart';

class CustomNowPlayingRowWidget extends StatelessWidget {
  const CustomNowPlayingRowWidget({super.key});

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
          AppStrings.kNowPlaying,
          style: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).textScaler.scale(20),

            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
