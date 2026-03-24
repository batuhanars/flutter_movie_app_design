import 'package:filmku/core/theme/app_colors.dart';
import 'package:filmku/features/detail/widgets/detail_cast.dart';
import 'package:filmku/features/detail/widgets/detail_content.dart';
import 'package:filmku/features/detail/widgets/detail_header.dart';
import 'package:filmku/models/movie_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            DetailHeader(coverUrl: movie.coverUrl, posterUrl: movie.posterUrl),
            Container(
              margin: const EdgeInsets.only(
                top: 275,
              ), // 375 height - 100 overlap
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  DetailContent(movie: movie),
                  const SizedBox(height: 24),
                  DetailCast(casts: movie.cast),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
