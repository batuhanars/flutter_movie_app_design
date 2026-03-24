import 'package:filmku/core/theme/app_colors.dart';
import 'package:filmku/core/theme/app_text_styles.dart';
import 'package:filmku/features/detail/screens/detail_screen.dart';
import 'package:filmku/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PopularMoviesItem extends StatelessWidget {
  final Movie movie;

  const PopularMoviesItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(movie: movie),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(movie.posterUrl),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(movie.title, style: AppTextStyles.titleMedium),
              Row(
                spacing: 4,
                children: [
                  SvgPicture.asset("assets/icons/star.svg"),
                  Text(
                    "${movie.rating}/10 IMDb",
                    style: AppTextStyles.bodyTextSmall,
                  ),
                ],
              ),
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
              Row(
                spacing: 4,
                children: [
                  SvgPicture.asset("assets/icons/duration.svg", width: 12),
                  Text(movie.length, style: AppTextStyles.titleSmall),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
