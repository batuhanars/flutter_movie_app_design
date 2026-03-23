import 'cast_model.dart';

class Movie {
  final String id;
  final String title;
  final String posterUrl;
  final String coverUrl;
  final double rating;
  final List<String> genres;
  final String length; // e.g., '2h 28min'
  final String language;
  final String pgRating;
  final String description;
  final List<Cast> cast;
  final bool isNowShowing;
  final bool isPopular;

  const Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    this.coverUrl = '',
    required this.rating,
    required this.genres,
    required this.length,
    this.language = 'English',
    this.pgRating = 'PG-13',
    required this.description,
    this.cast = const [],
    this.isNowShowing = false,
    this.isPopular = false,
  });
}
