import 'package:filmku/core/theme/app_colors.dart';
import 'package:filmku/core/theme/app_text_styles.dart';
import 'package:filmku/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailContent extends StatelessWidget {
  final Movie movie;

  const DetailContent({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(movie.title, style: AppTextStyles.titleLarge),
            SvgPicture.asset(
              "assets/icons/bookmarks.svg",
              colorFilter: ColorFilter.mode(
                AppColors.iconActive,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          spacing: 4,
          children: [
            SvgPicture.asset("assets/icons/star.svg"),
            Text("${movie.rating}/10 IMDb", style: AppTextStyles.bodyText),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          spacing: 8,
          children: movie.genres
              .map(
                (genre) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.badgeBackground,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(genre, style: AppTextStyles.badgeText),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Length", style: AppTextStyles.bodyText),
                Text(movie.length, style: AppTextStyles.titleSmall),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Language", style: AppTextStyles.bodyText),
                Text(movie.language, style: AppTextStyles.titleSmall),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Rating", style: AppTextStyles.bodyText),
                Text(movie.pgRating, style: AppTextStyles.titleSmall),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text("Description", style: AppTextStyles.heading3),
        const SizedBox(height: 8),
        Text(
          movie.description,
          style: TextStyle(
            fontFamily: AppTextStyles.sansSerifFontFamily,
            fontSize: 12,
            fontWeight: FontWeight.w400, // Regular
            color: AppColors.textSecondary,
            height: 2,
          ),
        ),
      ],
    );
  }
}
