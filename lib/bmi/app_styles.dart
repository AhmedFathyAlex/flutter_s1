import 'package:flutter/material.dart';
import 'package:flutter_s1/bmi/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final appbarTextStyle = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

    static final buttonTextStyle = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

    static final labelTextStyle = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.labelTextColor,
  );

     static final numberTextStyle = GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static final subtitleTextStyle = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static final resultTextStyle = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.green,
  );
}
