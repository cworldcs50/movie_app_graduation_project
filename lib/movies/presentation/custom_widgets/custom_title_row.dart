import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/app_strings.dart';

class CustomTitleRow extends StatelessWidget {
  const CustomTitleRow({required this.rowTitle, super.key});

  final String rowTitle;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 25, 15, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            rowTitle,
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).textScaler.scale(19),
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    AppStrings.kSeeMore,
                    style: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).textScaler.scale(17),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: MediaQuery.of(context).textScaler.scale(17),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
