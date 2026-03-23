import '../../models/cast_model.dart';
import '../../models/movie_model.dart';

class MockData {
  static const List<Movie> movies = [
    Movie(
      id: '1',
      title: 'Spiderman: No Way Home',
      posterUrl: 'assets/images/spiderman_poster.png',
      coverUrl: 'assets/images/spiderman_detail_poster.png',
      rating: 9.1,
      genres: ['ACTION', 'ADVENTURE', 'FANTASY'],
      length: '2h 28min',
      language: 'English',
      pgRating: 'PG-13',
      description: "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.",
      isNowShowing: true,
      cast: [
        Cast(name: 'Tom Holland', imageUrl: 'assets/images/tom_holland.png'),
        Cast(name: 'Zendaya', imageUrl: 'assets/images/zendaya.png'),
        Cast(name: 'Benedict Cumberbatch', imageUrl: 'assets/images/benedict_cumberbatch.png'),
        Cast(name: 'Jacob Batalon', imageUrl: 'assets/images/jacon_batalon.png'),
      ],
    ),
    Movie(
      id: '2',
      title: 'Eternals',
      posterUrl: 'assets/images/eternals_poster.png', 
      rating: 9.5,
      genres: ['ACTION', 'ADVENTURE', 'SCI-FI'],
      length: '2h 36min',
      description: "The saga of the Eternals, a race of immortal beings who lived on Earth and shaped its history and civilizations.",
      isNowShowing: true,
    ),
    Movie(
      id: '5',
      title: 'Shang-Chi',
      posterUrl: 'assets/images/shang_chi_poster.png',
      rating: 8.1,
      genres: ['ACTION', 'ADVENTURE', 'FANTASY'],
      length: '2h 12m',
      description: "Martial-arts master Shang-Chi confronts the past he thought he left behind when he's drawn into the web of the mysterious Ten Rings organization.",
      isNowShowing: true,
    ),
    Movie(
      id: '3',
      title: 'Venom Let There Be Carnage',
      posterUrl: 'assets/images/venom_poster.png',
      rating: 6.4,
      genres: ['HORROR', 'MYSTERY', 'THRILLER'],
      length: '1h 47m',
      description: "Eddie Brock attempts to reignite his career by interviewing serial killer Cletus Kasady, who becomes the host of the symbiote Carnage.",
      isPopular: true,
    ),
    Movie(
      id: '4',
      title: "The King's Man",
      posterUrl: 'assets/images/the_kings_man_poster.png',
      rating: 8.4,
      genres: ['ACTION', 'FANTASY'],
      length: '2h 11m',
      description: "In the early years of the 20th century, the Kingsman agency is formed to stand against a cabal plotting a war to wipe out millions.",
      isPopular: true,
    ),
  ];

  static List<Movie> get nowShowing => movies.where((m) => m.isNowShowing).toList();
  static List<Movie> get popular => movies.where((m) => m.isPopular).toList();
}
