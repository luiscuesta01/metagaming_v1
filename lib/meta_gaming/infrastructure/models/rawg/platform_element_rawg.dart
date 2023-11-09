import 'package:metagaming/meta_gaming/infrastructure/models/rawg/platform_platform_rawg.dart';
import 'package:metagaming/meta_gaming/infrastructure/models/rawg/requirements_rawg.dart';

class PlatformElementRawg {
    final PlatformPlatformRawg platform;
    final DateTime releasedAt;
    final RequirementsRawg? requirementsEn;
    final RequirementsRawg? requirementsRu;

    PlatformElementRawg({
        required this.platform,
        required this.releasedAt,
        required this.requirementsEn,
        required this.requirementsRu,
    });

    factory PlatformElementRawg.fromJson(Map<String, dynamic> json) => PlatformElementRawg(
        platform: PlatformPlatformRawg.fromJson(json["platform"]),
        releasedAt: DateTime.parse(json["released_at"]),
        requirementsEn: json["requirements_en"] == null ? null : RequirementsRawg.fromJson(json["requirements_en"]),
        requirementsRu: json["requirements_ru"] == null ? null : RequirementsRawg.fromJson(json["requirements_ru"]),
    );

    Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
        "released_at": "${releasedAt.year.toString().padLeft(4, '0')}-${releasedAt.month.toString().padLeft(2, '0')}-${releasedAt.day.toString().padLeft(2, '0')}",
        "requirements_en": requirementsEn?.toJson(),
        "requirements_ru": requirementsRu?.toJson(),
    };
}