class EsrbRatingRawg {
    final int id;
    final String name;
    final String slug;

    EsrbRatingRawg({
        required this.id,
        required this.name,
        required this.slug,
    });

    factory EsrbRatingRawg.fromJson(Map<String, dynamic> json) => EsrbRatingRawg(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        slug: json["slug"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
    };
}