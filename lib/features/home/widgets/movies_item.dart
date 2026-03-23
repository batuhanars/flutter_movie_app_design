import 'package:filmku/core/theme/app_colors.dart';
import 'package:filmku/core/theme/app_text_styles.dart';
import 'package:filmku/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MoviesItem extends StatelessWidget {
  final Movie movie;

  const MoviesItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.textPrimary.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                movie.posterUrl,
                height: 212,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(movie.title, style: AppTextStyles.titleMedium),
          Row(
            spacing: 4,
            children: [
              SvgPicture.asset("assets/icons/star.svg"),
              Text("${movie.rating}/10 IMDb", style: AppTextStyles.bodyText),
            ],
          ),
        ],
      ),
    );
  }
}
