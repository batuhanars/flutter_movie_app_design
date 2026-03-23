import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.textPrimary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.textPrimary,
        secondary: AppColors.badgeText,
        surface: AppColors.background,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: AppTextStyles.heading2,
      ),
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.heading1,
        displayMedium: AppTextStyles.heading2,
        displaySmall: AppTextStyles.heading3,
        titleLarge: AppTextStyles.titleLarge,
        titleMedium: AppTextStyles.titleMedium,
        bodyLarge: AppTextStyles.bodyText,
        bodyMedium: AppTextStyles.caption,
      ),
    );
  }
}
