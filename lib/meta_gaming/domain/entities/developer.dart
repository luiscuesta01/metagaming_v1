import 'package:metagaming/meta_gaming/infrastructure/models/rawg/models.dart';

class Developer {
  final int id;
  final String name;
  final String slug;
  final int gamesCount;
  final String imageBackground;

  Developer({
    required this.id,
    required this.name,
    required this.slug,
    required this.gamesCount,
    required this.imageBackground,
  });

  factory Developer.fromDeveloperRawg(DeveloperRawg developerRawg) => Developer(
      id: developerRawg.id,
      name: developerRawg.name,
      slug: developerRawg.slug,
      gamesCount: developerRawg.gamesCount,
      imageBackground: developerRawg.imageBackground);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'gamesCount': gamesCount,
        'imageBackground': imageBackground,
      };

  factory Developer.fromJson(Map<String, dynamic> json) {
    return Developer(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      gamesCount: json['gamesCount'],
      imageBackground: json['imageBackground'],
    );
  }
}
