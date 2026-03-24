import 'package:filmku/core/theme/app_colors.dart';
import 'package:filmku/core/theme/app_text_styles.dart';
import 'package:filmku/models/cast_model.dart';
import 'package:flutter/material.dart';

class DetailCast extends StatelessWidget {
  final List<Cast> casts;

  const DetailCast({super.key, required this.casts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Cast", style: AppTextStyles.heading3),
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
        const SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: casts.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final cast = casts[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      cast.imageUrl,
                      width: 78,
                      height: 72,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 78,
                    child: Text(
                      cast.name,
                      style: AppTextStyles.titleSmall,
                      maxLines: 2,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
