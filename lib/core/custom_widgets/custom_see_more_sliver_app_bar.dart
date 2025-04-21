import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({required this.title, super.key});

  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      title: Text(
        title,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
    );
  }
}
