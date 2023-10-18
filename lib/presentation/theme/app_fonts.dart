import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:news/presentation/theme/app_colors.dart';

sealed class AppFonts {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight w600 = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  static final kTextStyleParagraph16R = GoogleFonts.nunitoSans(
    color: AppColors.text,
    fontWeight: regular,
    fontSize: 16.0,
    height: 1.6,
  );

  static final head1 = GoogleFonts.nunitoSans(
    color: AppColors.text,
    fontWeight: bold,
    fontSize: 28.0,
    height: 1.14,
  );

  static final nunito18w700basic0 = GoogleFonts.nunitoSans(
    color: AppColors.basic0,
    fontWeight: bold,
    fontSize: 18.0,
    height: 1.77,
  );

  static final nunito14w700white = GoogleFonts.nunitoSans(
    color: AppColors.white,
    fontWeight: bold,
    fontSize: 14.0,
    height: 1.2,
  );

  static final nunito10w400basic0 = GoogleFonts.nunitoSans(
    color: AppColors.basic0,
    fontWeight: regular,
    fontSize: 10.0,
    height: 1.6,
  );

  static final label = GoogleFonts.nunitoSans(
    color: AppColors.basic0,
    fontWeight: w600,
    fontSize: 14.0,
    height: 1.42,
  );

  static final nunito24w700 = GoogleFonts.nunitoSans(
    color: const Color(0xFF1F1C1F),
    fontWeight: bold,
    fontSize: 24.0,
    height: 1.42,
  );
}