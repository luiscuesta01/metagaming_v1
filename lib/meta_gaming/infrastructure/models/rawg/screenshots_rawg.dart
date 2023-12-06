
class ResponseScreenshots {
    final int count;
    final dynamic next;
    final dynamic previous;
    final List<ScreenshotsRawg> results;

    ResponseScreenshots({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory ResponseScreenshots.fromJson(Map<String, dynamic> json) => ResponseScreenshots(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<ScreenshotsRawg>.from(json["results"].map((x) => ScreenshotsRawg.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class ScreenshotsRawg {
    final int id;
    final String image;
    final int width;
    final int height;
    final bool isDeleted;

    ScreenshotsRawg({
        required this.id,
        required this.image,
        required this.width,
        required this.height,
        required this.isDeleted,
    });

    factory ScreenshotsRawg.fromJson(Map<String, dynamic> json) => ScreenshotsRawg(
        id: json["id"],
        image: json["image"],
        width: json["width"],
        height: json["height"],
        isDeleted: json["is_deleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "width": width,
        "height": height,
        "is_deleted": isDeleted,
    };
}
