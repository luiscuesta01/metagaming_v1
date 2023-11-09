import 'package:metagaming/meta_gaming/infrastructure/models/rawg/game_rawg.dart';
import 'package:metagaming/meta_gaming/infrastructure/models/rawg/models.dart';

class ParentPlatformRawg {
    final EsrbRatingRawg platform;

    ParentPlatformRawg({
        required this.platform,
    });

    factory ParentPlatformRawg.fromJson(Map<String, dynamic> json) => ParentPlatformRawg(
        platform: EsrbRatingRawg.fromJson(json["platform"]),
    );

    Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
    };
}