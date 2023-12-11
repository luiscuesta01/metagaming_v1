import 'package:metagaming/meta_gaming/domain/entities/screenshots.dart';
import 'package:metagaming/meta_gaming/infrastructure/models/rawg/screenshots_rawg.dart';

class ScreenshotsMapper {
  static Screenshots screenshotsRawgToEntity(ScreenshotsRawg screenshotsRawg) {
    return Screenshots(
        id: screenshotsRawg.id,
        image: screenshotsRawg.image,
        width: screenshotsRawg.width,
        height: screenshotsRawg.height,
        isDeleted: screenshotsRawg.isDeleted);
  }
}
