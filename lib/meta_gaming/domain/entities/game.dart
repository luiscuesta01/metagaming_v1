import 'package:metagaming/meta_gaming/domain/entities/developer.dart';
import 'package:metagaming/meta_gaming/domain/entities/genre.dart';
import 'package:metagaming/meta_gaming/domain/entities/parent_platform.dart';

class Game {
  final int id;
  final String slug;
  final String name;
  final String description;
  final String descriptionRaw;
  final DateTime released;
  final String backgroundImage;
  final double rating;
  final int suggestionsCount;
  final dynamic userGame;
  final int reviewsCount;
  final List<Genre> genres;
  final dynamic clip;
  final List<Developer> genresDeveloper;
  final List<ParentPlatform> parentPlatforms;
  final int metacritic;
  final int playtime;
  final String status;

  Game({
    required this.id,
    required this.slug,
    required this.name,
    required this.description,
    required this.descriptionRaw,
    required this.released,
    required this.backgroundImage,
    required this.rating,
    required this.suggestionsCount,
    required this.userGame,
    required this.reviewsCount,
    required this.genres,
    required this.clip,
    required this.genresDeveloper,
    required this.parentPlatforms,
    required this.metacritic,
    required this.playtime,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'name': name,
        'description': description,
        'descriptionRaw': descriptionRaw,
        'released': released.toIso8601String(),
        'backgroundImage': backgroundImage,
        'rating': rating,
        'suggestionsCount': suggestionsCount,
        'userGame': userGame,
        'reviewsCount': reviewsCount,
        'genres': genres.map((genre) => genre.toJson()).toList(),
        'clip': clip,
        'genresDeveloper':
            genresDeveloper.map((developer) => developer.toJson()).toList(),
        'parentPlatforms':
            parentPlatforms.map((platform) => platform.toJson()).toList(),
        'metacritic': metacritic,
        'playtime': playtime,
        'status': status,
      };

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      description: json['description'],
      descriptionRaw: json['descriptionRaw'],
      released: DateTime.parse(json['released']),
      backgroundImage: json['backgroundImage'],
      rating: json['rating'],
      suggestionsCount: json['suggestionsCount'],
      userGame: json['userGame'],
      reviewsCount: json['reviewsCount'],
      genres: (json['genres'] as List).map((i) => Genre.fromJson(i)).toList(),
      clip: json['clip'],
      genresDeveloper: (json['genresDeveloper'] as List)
          .map((i) => Developer.fromJson(i))
          .toList(),
      parentPlatforms: (json['parentPlatforms'] as List)
          .map((i) => ParentPlatform.fromJson(i))
          .toList(),
      metacritic: json['metacritic'],
      playtime: json['playtime'],
      status: json['status'],
    );
  }
}
