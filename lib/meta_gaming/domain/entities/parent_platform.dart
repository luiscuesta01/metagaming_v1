import 'package:metagaming/meta_gaming/domain/entities/platform.dart';
import 'package:metagaming/meta_gaming/infrastructure/models/rawg/parent_platform_rawg.dart';

class ParentPlatform {
    final Platform platform;

    ParentPlatform({
        required this.platform,
    });
  
    // final parentPlatforms = game.parentPlatforms.map((platform) {
    //   return Platform.fromEsrbRatingRawg(
    //       platform); // Usa el constructor de Cobro para la conversión
    // }).toList();
    
    factory ParentPlatform.fromParentPlatformRawg(ParentPlatformRawg parentPlatformRawg) => 
    ParentPlatform(
      
      platform: Platform.fromEsrbRatingRawg(parentPlatformRawg.platform));
}