import 'package:flutter/material.dart';

class CustomReleaseDate extends StatelessWidget {
  const CustomReleaseDate({
    required this.color,
    required this.releaseDate,
    super.key,
  });

  final Color color;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        releaseDate,
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
