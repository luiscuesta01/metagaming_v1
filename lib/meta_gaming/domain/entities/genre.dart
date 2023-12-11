import 'package:metagaming/meta_gaming/infrastructure/models/rawg/models.dart';

class Genre {
  final int id;
  final String name;
  final String slug;
  final int gamesCount;
  final String imageBackground;

  Genre({
    required this.id,
    required this.name,
    required this.slug,
    required this.gamesCount,
    required this.imageBackground,
  });

  factory Genre.fromGenreRawg(GenreRawg genreRawg) => Genre(
      id: genreRawg.id,
      name: genreRawg.name,
      slug: genreRawg.slug,
      gamesCount: genreRawg.gamesCount,
      imageBackground: genreRawg.imageBackground);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'gamesCount': gamesCount,
        'imageBackground': imageBackground,
      };

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      gamesCount: json['gamesCount'],
      imageBackground: json['imageBackground'],
    );
  }
}
