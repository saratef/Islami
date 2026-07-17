import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/utils/app_colors.dart';

class AppStyles {
  static final TextStyle bold16primary = GoogleFonts.amiri(
    color: AppColors.primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bold24primary = GoogleFonts.amiri(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static final TextStyle bold20primary = GoogleFonts.amiri(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static final TextStyle bold12white = GoogleFonts.amiri(
    color: AppColors.whiteColor,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle bold16white = GoogleFonts.amiri(
    color: AppColors.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle bold20white = GoogleFonts.amiri(
    color: AppColors.whiteColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle bold24black = GoogleFonts.amiri(
    color: AppColors.blackColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle bold14black = GoogleFonts.amiri(
    color: AppColors.blackColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle bold14blackElmessiri = GoogleFonts.elMessiri(
    color: AppColors.blackColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bold22blackElmessiri = GoogleFonts.elMessiri(
    color: AppColors.blackColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
}
