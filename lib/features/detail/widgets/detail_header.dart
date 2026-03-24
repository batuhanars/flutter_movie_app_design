import 'package:filmku/core/theme/app_colors.dart';
import 'package:filmku/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailHeader extends StatelessWidget {
  final String coverUrl;
  final String posterUrl;

  const DetailHeader({
    super.key,
    required this.coverUrl,
    required this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          coverUrl.isNotEmpty ? coverUrl : posterUrl,
          height: 375,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 375,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
            ),
          ),
        ),
        SizedBox(
          height: 375,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset("assets/icons/back.svg"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SvgPicture.asset("assets/icons/list_menu.svg"),
                  ],
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0, -100, 0),
                child: Column(
                  spacing: 8,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: SvgPicture.asset("assets/icons/play.svg"),
                    ),
                    Text(
                      "Play Trailer",
                      style: TextStyle(
                        color: AppColors.background,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppTextStyles.sansSerifFontFamily,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
