import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // The design uses a Serif font for headings (like Merriweather, Playfair Display, or PT Serif)
  static const String serifFontFamily = 'Merriweather';

  // The design uses a Sans-Serif font for body and titles (like Mulish, Inter, or Roboto)
  static const String sansSerifFontFamily = 'Mulish';

  // --- Serif Headings ---

  static const TextStyle heading1 = TextStyle(
    fontFamily: serifFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w900, // Black/ExtraBold
    color: AppColors.textPrimary,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: serifFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w700, // Bold
    color: AppColors.textPrimary,
  );

  static const TextStyle heading3 = TextStyle(
    fontFamily: serifFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w700, // Bold
    color: AppColors.textPrimary,
  );

  // --- Sans-Serif Text ---

  static const TextStyle titleLarge = TextStyle(
    fontFamily: sansSerifFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w700, // Bold
    color: AppColors.textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: sansSerifFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.textPrimary,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: sansSerifFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyText = TextStyle(
    fontFamily: sansSerifFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle bodyTextSmall = TextStyle(
    fontFamily: sansSerifFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: sansSerifFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.textSecondary,
  );

  static const TextStyle badgeText = TextStyle(
    fontFamily: sansSerifFontFamily,
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: AppColors.badgeText,
  );
}
