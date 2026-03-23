import 'package:filmku/core/constants/mock_data.dart';
import 'package:filmku/core/theme/app_colors.dart';
import 'package:filmku/core/theme/app_text_styles.dart';
import 'package:filmku/features/home/widgets/popular_movies_item.dart';
import 'package:flutter/material.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Popular", style: AppTextStyles.heading3),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textSecondary),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text("See more", style: AppTextStyles.bodyTextSmall),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 283,
          child: ListView.separated(
            itemCount: MockData.popular.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final movie = MockData.popular[index];
              return PopularMoviesItem(movie: movie);
            },
          ),
        ),
      ],
    );
  }
}
