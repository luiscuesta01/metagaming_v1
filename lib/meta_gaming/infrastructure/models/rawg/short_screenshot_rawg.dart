class ShortScreenshotRawg {
    final int id;
    final String image;

    ShortScreenshotRawg({
        required this.id,
        required this.image,
    });

    factory ShortScreenshotRawg.fromJson(Map<String, dynamic> json) => ShortScreenshotRawg(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
    };
}