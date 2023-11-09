import 'package:metagaming/meta_gaming/infrastructure/models/rawg/game_rawg.dart';
import 'package:metagaming/meta_gaming/infrastructure/models/rawg/models.dart';

class RatingRawg {
    final int id;
    final Title title;
    final int count;
    final double percent;

    RatingRawg({
        required this.id,
        required this.title,
        required this.count,
        required this.percent,
    });

    factory RatingRawg.fromJson(Map<String, dynamic> json) => RatingRawg(
        id: json["id"],
        title: titleValues.map[json["title"]]!,
        count: json["count"],
        percent: json["percent"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "count": count,
        "percent": percent,
    };
}

enum Title {
    EXCEPTIONAL,
    MEH,
    RECOMMENDED,
    SKIP
}

final titleValues = EnumValuesRawg({
    "exceptional": Title.EXCEPTIONAL,
    "meh": Title.MEH,
    "recommended": Title.RECOMMENDED,
    "skip": Title.SKIP
});