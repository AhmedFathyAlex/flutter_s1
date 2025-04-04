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
}
