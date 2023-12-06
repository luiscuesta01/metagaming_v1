import 'package:metagaming/meta_gaming/infrastructure/models/rawg/models.dart';

class GenreRawg {
    final int id;
    final String name;
    final String slug;
    final int gamesCount;
    final String imageBackground;
    final Domain? domain;
    final Language? language;

    GenreRawg({
        required this.id,
        required this.name,
        required this.slug,
        required this.gamesCount,
        required this.imageBackground,
        this.domain,
        this.language,
    });

    factory GenreRawg.fromJson(Map<String, dynamic> json) => GenreRawg(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"] ?? 0,
        imageBackground: json["image_background"] ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
        domain: domainValues.map[json["domain"]],
        language: languageValues.map[json["language"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "domain": domainValues.reverse[domain],
        "language": languageValues.reverse[language],
    };
}
enum Domain {
    APPS_APPLE_COM,
    EPICGAMES_COM,
    GOG_COM,
    MARKETPLACE_XBOX_COM,
    MICROSOFT_COM,
    NINTENDO_COM,
    PLAY_GOOGLE_COM,
    STORE_PLAYSTATION_COM,
    STORE_STEAMPOWERED_COM
}

final domainValues = EnumValuesRawg({
    "apps.apple.com": Domain.APPS_APPLE_COM,
    "epicgames.com": Domain.EPICGAMES_COM,
    "gog.com": Domain.GOG_COM,
    "marketplace.xbox.com": Domain.MARKETPLACE_XBOX_COM,
    "microsoft.com": Domain.MICROSOFT_COM,
    "nintendo.com": Domain.NINTENDO_COM,
    "play.google.com": Domain.PLAY_GOOGLE_COM,
    "store.playstation.com": Domain.STORE_PLAYSTATION_COM,
    "store.steampowered.com": Domain.STORE_STEAMPOWERED_COM
});
enum Language {
    ENG
}

final languageValues = EnumValuesRawg({
    "eng": Language.ENG
});