// To parse this JSON data, do
//
//     final gameDetails = gameDetailsFromJson(jsonString);

import 'dart:convert';

import 'package:metagaming/meta_gaming/infrastructure/models/rawg/models.dart';

GameDetails gameDetailsFromJson(String str) => GameDetails.fromJson(json.decode(str));

String gameDetailsToJson(GameDetails data) => json.encode(data.toJson());

class GameDetails {
    final int id;
    final String slug;
    final String name;
    final String nameOriginal;
    final String description;
    final int metacritic;
    final List<dynamic> metacriticPlatforms;
    final DateTime released;
    final bool tba;
    final DateTime updated;
    final String backgroundImage;
    final String backgroundImageAdditional;
    final String website;
    final double rating;
    final int ratingTop;
    final List<RatingRawg> ratings;
    final Map<String, int> reactions;
    final int added;
    final AddedByStatus addedByStatus;
    final int playtime;
    final int screenshotsCount;
    final int moviesCount;
    final int creatorsCount;
    final int achievementsCount;
    final int parentAchievementsCount;
    final String redditUrl;
    final String redditName;
    final String redditDescription;
    final String redditLogo;
    final int redditCount;
    final int twitchCount;
    final int youtubeCount;
    final int reviewsTextCount;
    final int ratingsCount;
    final int suggestionsCount;
    final List<dynamic> alternativeNames;
    final String metacriticUrl;
    final int parentsCount;
    final int additionsCount;
    final int gameSeriesCount;
    final dynamic userGame;
    final int reviewsCount;
    final String saturatedColor;
    final String dominantColor;
    final List<ParentPlatformRawg> parentPlatforms;
    final List<PlatformElementRawg> platforms;
    final List<Store> stores;
    final List<DeveloperRawg> developers;
    final List<DeveloperRawg> genres;
    final List<DeveloperRawg> tags;
    final List<DeveloperRawg> publishers;
    final EsrbRatingRawg esrbRating;
    final dynamic clip;
    final String descriptionRaw;

    GameDetails({
        required this.id,
        required this.slug,
        required this.name,
        required this.nameOriginal,
        required this.description,
        required this.metacritic,
        required this.metacriticPlatforms,
        required this.released,
        required this.tba,
        required this.updated,
        required this.backgroundImage,
        required this.backgroundImageAdditional,
        required this.website,
        required this.rating,
        required this.ratingTop,
        required this.ratings,
        required this.reactions,
        required this.added,
        required this.addedByStatus,
        required this.playtime,
        required this.screenshotsCount,
        required this.moviesCount,
        required this.creatorsCount,
        required this.achievementsCount,
        required this.parentAchievementsCount,
        required this.redditUrl,
        required this.redditName,
        required this.redditDescription,
        required this.redditLogo,
        required this.redditCount,
        required this.twitchCount,
        required this.youtubeCount,
        required this.reviewsTextCount,
        required this.ratingsCount,
        required this.suggestionsCount,
        required this.alternativeNames,
        required this.metacriticUrl,
        required this.parentsCount,
        required this.additionsCount,
        required this.gameSeriesCount,
        required this.userGame,
        required this.reviewsCount,
        required this.saturatedColor,
        required this.dominantColor,
        required this.parentPlatforms,
        required this.platforms,
        required this.stores,
        required this.developers,
        required this.genres,
        required this.tags,
        required this.publishers,
        required this.esrbRating,
        required this.clip,
        required this.descriptionRaw,
    });

    factory GameDetails.fromJson(Map<String, dynamic> json) => GameDetails(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        nameOriginal: json["name_original"],
        description: json["description"],
        metacritic: json["metacritic"] ?? 0,
        metacriticPlatforms: List<dynamic>.from(json["metacritic_platforms"].map((x) => x)),
        released: DateTime.parse(json["released"] ?? '0000-00-00'),
        tba: json["tba"],
        updated: DateTime.parse(json["updated"]),
        backgroundImage: json["background_image"],
        backgroundImageAdditional: json["background_image_additional"],
        website: json["website"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratings: List<RatingRawg>.from(json["ratings"].map((x) => RatingRawg.fromJson(x))),
        reactions: Map.from(json["reactions"] ?? {}).map((k, v) => MapEntry<String, int>(k, v)),
        added: json["added"],
        addedByStatus: AddedByStatus.fromJson(json["added_by_status"]),
        playtime: json["playtime"],
        screenshotsCount: json["screenshots_count"],
        moviesCount: json["movies_count"],
        creatorsCount: json["creators_count"],
        achievementsCount: json["achievements_count"],
        parentAchievementsCount: json["parent_achievements_count"],
        redditUrl: json["reddit_url"],
        redditName: json["reddit_name"],
        redditDescription: json["reddit_description"],
        redditLogo: json["reddit_logo"],
        redditCount: json["reddit_count"],
        twitchCount: json["twitch_count"],
        youtubeCount: json["youtube_count"],
        reviewsTextCount: json["reviews_text_count"],
        ratingsCount: json["ratings_count"],
        suggestionsCount: json["suggestions_count"],
        alternativeNames: List<dynamic>.from(json["alternative_names"].map((x) => x)),
        metacriticUrl: json["metacritic_url"],
        parentsCount: json["parents_count"],
        additionsCount: json["additions_count"],
        gameSeriesCount: json["game_series_count"],
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        parentPlatforms: List<ParentPlatformRawg>.from(json["parent_platforms"].map((x) => ParentPlatformRawg.fromJson(x))),
        platforms: List<PlatformElementRawg>.from(json["platforms"].map((x) => PlatformElementRawg.fromJson(x))),
        stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
        developers: List<DeveloperRawg>.from(json["developers"].map((x) => DeveloperRawg.fromJson(x))),
        genres: List<DeveloperRawg>.from(json["genres"].map((x) => DeveloperRawg.fromJson(x))),
        tags: List<DeveloperRawg>.from(json["tags"].map((x) => DeveloperRawg.fromJson(x))),
        publishers: List<DeveloperRawg>.from(json["publishers"].map((x) => DeveloperRawg.fromJson(x))),
        esrbRating: EsrbRatingRawg.fromJson(json["esrb_rating"] ?? {}),
        clip: json["clip"],
        descriptionRaw: json["description_raw"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "name_original": nameOriginal,
        "description": description,
        "metacritic": metacritic,
        "metacritic_platforms": List<dynamic>.from(metacriticPlatforms.map((x) => x)),
        "released": "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
        "tba": tba,
        "updated": updated.toIso8601String(),
        "background_image": backgroundImage,
        "background_image_additional": backgroundImageAdditional,
        "website": website,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": List<dynamic>.from(ratings.map((x) => x.toJson())),
        "reactions": Map.from(reactions).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "added": added,
        "added_by_status": addedByStatus.toJson(),
        "playtime": playtime,
        "screenshots_count": screenshotsCount,
        "movies_count": moviesCount,
        "creators_count": creatorsCount,
        "achievements_count": achievementsCount,
        "parent_achievements_count": parentAchievementsCount,
        "reddit_url": redditUrl,
        "reddit_name": redditName,
        "reddit_description": redditDescription,
        "reddit_logo": redditLogo,
        "reddit_count": redditCount,
        "twitch_count": twitchCount,
        "youtube_count": youtubeCount,
        "reviews_text_count": reviewsTextCount,
        "ratings_count": ratingsCount,
        "suggestions_count": suggestionsCount,
        "alternative_names": List<dynamic>.from(alternativeNames.map((x) => x)),
        "metacritic_url": metacriticUrl,
        "parents_count": parentsCount,
        "additions_count": additionsCount,
        "game_series_count": gameSeriesCount,
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color": saturatedColor,
        "dominant_color": dominantColor,
        "parent_platforms": List<dynamic>.from(parentPlatforms.map((x) => x.toJson())),
        "platforms": List<dynamic>.from(platforms.map((x) => x.toJson())),
        "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
        "developers": List<dynamic>.from(developers.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "publishers": List<dynamic>.from(publishers.map((x) => x.toJson())),
        "esrb_rating": esrbRating.toJson(),
        "clip": clip,
        "description_raw": descriptionRaw,
    };
}

class AddedByStatus {
    final int yet;
    final int owned;
    final int beaten;
    final int toplay;
    final int dropped;
    final int playing;

    AddedByStatus({
        required this.yet,
        required this.owned,
        required this.beaten,
        required this.toplay,
        required this.dropped,
        required this.playing,
    });

    factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"]?? 0,
        owned: json["owned"]?? 0,
        beaten: json["beaten"] ?? 0,
        toplay: json["toplay"]?? 0,
        dropped: json["dropped"]?? 0,
        playing: json["playing"]?? 0,
    );

    Map<String, dynamic> toJson() => {
        "yet": yet,
        "owned": owned,
        "beaten": beaten,
        "toplay": toplay,
        "dropped": dropped,
        "playing": playing,
    };
}

class DeveloperRawg {
    final int id;
    final String name;
    final String slug;
    final int gamesCount;
    final String imageBackground;
    final String? domain;
    final Language? language;

    DeveloperRawg({
        required this.id,
        required this.name,
        required this.slug,
        required this.gamesCount,
        required this.imageBackground,
        this.domain,
        this.language,
    });

    factory DeveloperRawg.fromJson(Map<String, dynamic> json) => DeveloperRawg(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        domain: json["domain"],
        language: languageValues.map[json["language"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "domain": domain,
        "language": languageValues.reverse[language],
    };
}


class Store {
    final int id;
    final String url;
    final DeveloperRawg store;

    Store({
        required this.id,
        required this.url,
        required this.store,
    });

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        url: json["url"],
        store: DeveloperRawg.fromJson(json["store"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "store": store.toJson(),
    };
}


