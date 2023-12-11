import 'package:metagaming/meta_gaming/domain/entities/platform.dart';
import 'package:metagaming/meta_gaming/infrastructure/models/rawg/parent_platform_rawg.dart';

class ParentPlatform {
  final Platform platform;

  ParentPlatform({
    required this.platform,
  });

  factory ParentPlatform.fromParentPlatformRawg(
          ParentPlatformRawg parentPlatformRawg) =>
      ParentPlatform(
          platform: Platform.fromEsrbRatingRawg(parentPlatformRawg.platform));

  Map<String, dynamic> toJson() => {
        'platform': platform.toJson(),
      };

  factory ParentPlatform.fromJson(Map<String, dynamic> json) {
    return ParentPlatform(
      platform: Platform.fromJson(json['platform']),
    );
  }
}
