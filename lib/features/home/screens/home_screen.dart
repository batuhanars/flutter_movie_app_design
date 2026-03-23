import 'package:filmku/features/home/widgets/background_layout.dart';
import 'package:filmku/features/home/widgets/home_header.dart';
import 'package:filmku/features/home/widgets/movies.dart';
import 'package:filmku/features/home/widgets/popular_movies.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundLayout(),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              children: [
                const HomeHeader(),
                const SizedBox(height: 36),
                Movies(),
                const SizedBox(height: 24),
                PopularMovies(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
