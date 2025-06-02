import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  //appbar text style
  static TextStyle appBarTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.black,
    );
  }

  //title text style
  static TextStyle titleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  //sub title title text style
  static TextStyle subTitleTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall!.copyWith(
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontWeight: FontWeight.bold,
      color: Colors.black.withValues(alpha: .5),
    );
  }

  //sub title title text style
  static TextStyle labelTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  //info textstyle
  static TextStyle infoTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall!.copyWith(
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontWeight: FontWeight.bold,
      color: Colors.grey.shade500,
    );
  }

  //text button text style
  static TextStyle textButtonTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium!.copyWith(
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 14,
      // color: AppColor.primaryColor,
    );
  }
}
