class PlatformPlatformRawg {
    final int id;
    final String name;
    final String slug;
    final dynamic image;
    final dynamic yearEnd;
    final int? yearStart;
    final int gamesCount;
    final String imageBackground;

    PlatformPlatformRawg({
        required this.id,
        required this.name,
        required this.slug,
        required this.image,
        required this.yearEnd,
        required this.yearStart,
        required this.gamesCount,
        required this.imageBackground,
    });

    factory PlatformPlatformRawg.fromJson(Map<String, dynamic> json) => PlatformPlatformRawg(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart,
        "games_count": gamesCount,
        "image_background": imageBackground,
    };
}