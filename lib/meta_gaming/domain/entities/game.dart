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
        required this.playtime
    });
}