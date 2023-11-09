import 'package:metagaming/meta_gaming/domain/entities/genre.dart';

class Game {
    final int id;
    final String slug;
    final String name;
    final DateTime released;
    final String backgroundImage;
    final double rating;
    final int suggestionsCount;
    final dynamic userGame;
    final int reviewsCount;
    final List<Genre> genres;
    final dynamic clip;


    Game({
        required this.id,
        required this.slug,
        required this.name,
        required this.released,
        required this.backgroundImage,
        required this.rating,
        required this.suggestionsCount,
        required this.userGame,
        required this.reviewsCount,
        required this.genres,
        required this.clip,
    });
}