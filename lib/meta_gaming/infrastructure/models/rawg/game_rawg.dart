import 'package:metagaming/meta_gaming/infrastructure/models/rawg/models.dart';

class GameRawg {
    final int id;
    final String slug;
    final String name;
    final DateTime released;
    final bool tba;
    final String backgroundImage;
    final double rating;
    final int ratingTop;
    final List<RatingRawg> ratings;
    final int ratingsCount;
    final int reviewsTextCount;
    final int added;
    final AddedByStatusRawg addedByStatus;
    final int metacritic;
    final int playtime;
    final int suggestionsCount;
    final DateTime updated;
    final dynamic userGame;
    final int reviewsCount;
    final Color saturatedColor;
    final Color dominantColor;
    final List<PlatformElementRawg> platforms;
    final List<ParentPlatformRawg> parentPlatforms;
    final List<GenreRawg> genres;
    final List<StoreRawg> stores;
    final dynamic clip;
    final List<GenreRawg> tags;
    final EsrbRatingRawg esrbRating;
    final List<ShortScreenshotRawg> shortScreenshots;

    GameRawg({
        required this.id,
        required this.slug,
        required this.name,
        required this.released,
        required this.tba,
        required this.backgroundImage,
        required this.rating,
        required this.ratingTop,
        required this.ratings,
        required this.ratingsCount,
        required this.reviewsTextCount,
        required this.added,
        required this.addedByStatus,
        required this.metacritic,
        required this.playtime,
        required this.suggestionsCount,
        required this.updated,
        required this.userGame,
        required this.reviewsCount,
        required this.saturatedColor,
        required this.dominantColor,
        required this.platforms,
        required this.parentPlatforms,
        required this.genres,
        required this.stores,
        required this.clip,
        required this.tags,
        required this.esrbRating,
        required this.shortScreenshots,
    });

    factory GameRawg.fromJson(Map<String, dynamic> json) => GameRawg(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        released: DateTime.parse(json["released"] ?? '0000-00-00'),
        tba: json["tba"],
        backgroundImage: json["background_image"] ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratings: List<RatingRawg>.from(json["ratings"].map((x) => RatingRawg.fromJson(x))),
        ratingsCount: json["ratings_count"],
        reviewsTextCount: json["reviews_text_count"],
        added: json["added"],
        addedByStatus: AddedByStatusRawg.fromJson(json["added_by_status"] ?? {}),
        metacritic: json["metacritic"] ?? 0,
        playtime: json["playtime"],
        suggestionsCount: json["suggestions_count"],
        updated: DateTime.parse(json["updated"]),
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: colorValues.map[json["saturated_color"]]!,
        dominantColor: colorValues.map[json["dominant_color"]]!,
      platforms: List<PlatformElementRawg>.from((json["platforms"] ?? []).map((x) => PlatformElementRawg.fromJson(x))),
        parentPlatforms: List<ParentPlatformRawg>.from((json["parent_platforms"] ?? []).map((x) => ParentPlatformRawg.fromJson(x))),
        genres: List<GenreRawg>.from(json["genres"].map((x) => GenreRawg.fromJson(x))),
        stores: List<StoreRawg>.from(json["stores"]?.map((x) => StoreRawg.fromJson(x))??[]),
        clip: json["clip"],
        tags: List<GenreRawg>.from(json["tags"].map((x) => GenreRawg.fromJson(x))),
        esrbRating: EsrbRatingRawg.fromJson(json["esrb_rating"] ?? {'rating': 'Not Rated'}),
        shortScreenshots: List<ShortScreenshotRawg>.from(json["short_screenshots"].map((x) => ShortScreenshotRawg.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "released": "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
        "tba": tba,
        "background_image": backgroundImage,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "added": added,
        "added_by_status": addedByStatus.toJson(),
        "metacritic": metacritic,
        "playtime": playtime,
        "suggestions_count": suggestionsCount,
        "updated": updated.toIso8601String(),
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color": colorValues.reverse[saturatedColor],
        "dominant_color": colorValues.reverse[dominantColor],
        "platforms": List<dynamic>.from(platforms.map((x) => x.toJson())),
        "parent_platforms": List<dynamic>.from(parentPlatforms.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
        "clip": clip,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "esrb_rating": esrbRating.toJson(),
        "short_screenshots": List<dynamic>.from(shortScreenshots.map((x) => x.toJson())),
    };
}



enum Color {
    THE_0_F0_F0_F
}

final colorValues = EnumValuesRawg({
    "0f0f0f": Color.THE_0_F0_F0_F
});



