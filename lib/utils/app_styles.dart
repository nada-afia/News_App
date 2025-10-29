import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'App_colors.dart';

class AppStyles {
  static TextStyle blackMed14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static TextStyle blackBold16 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  static TextStyle whiteBold16 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static TextStyle whiteMed14 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
}