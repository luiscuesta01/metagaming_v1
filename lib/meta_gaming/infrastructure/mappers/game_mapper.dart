import 'package:metagaming/meta_gaming/domain/entities/developer.dart';
import 'package:metagaming/meta_gaming/domain/entities/game.dart';
import 'package:metagaming/meta_gaming/domain/entities/genre.dart';
import 'package:metagaming/meta_gaming/domain/entities/parent_platform.dart';
import 'package:metagaming/meta_gaming/infrastructure/models/rawg/game_rawg.dart';
import '../models/rawg/game_details.dart';
class GameMapper {
  
  static Game gameRawgToEntity(GameRawg gameRawg) {
  
  final genres = gameRawg.genres.map((genreRawg) {
      return Genre.fromGenreRawg(
          genreRawg); // Usa el constructor de Cobro para la conversión
    }).toList();
  
  final parentPlatforms = gameRawg.parentPlatforms.map((parentPlatformsRawg) {
      return ParentPlatform.fromParentPlatformRawg(
          parentPlatformsRawg); // Usa el constructor de Cobro para la conversión
    }).toList();
  return Game(
      id: gameRawg.id,
      slug: gameRawg.slug,
      name: gameRawg.name,
      released: gameRawg.released,
      backgroundImage: (gameRawg.backgroundImage != '') 
        ? gameRawg.backgroundImage
        : 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/9556d16312333.5691dd2255721.jpg',
      rating: gameRawg.rating,
      suggestionsCount: gameRawg.suggestionsCount,
      userGame: gameRawg.userGame,
      reviewsCount: gameRawg.reviewsCount,
      genres: genres,
      clip: gameRawg.clip, 
      description: '',
      descriptionRaw: '',
      genresDeveloper: [], 
      parentPlatforms: parentPlatforms,
      metacritic: gameRawg.metacritic,
      playtime: gameRawg.playtime
      );
}

  static Game gameDetailsToEntity(GameDetails gameRawg) {
 
  final genresDeveloper = gameRawg.developers.map((developerRawg) {
      return Developer.fromDeveloperRawg(
          developerRawg); // Usa el constructor de Cobro para la conversión
    }).toList();
final parentPlatforms = gameRawg.parentPlatforms.map((parentPlatformsRawg) {
      return ParentPlatform.fromParentPlatformRawg(
          parentPlatformsRawg); // Usa el constructor de Cobro para la conversión
    }).toList();
  return Game(
    
    id: gameRawg.id,
      slug: gameRawg.slug,
      name: gameRawg.name,
      released: gameRawg.released,
      backgroundImage: (gameRawg.backgroundImage != '') 
        ? gameRawg.backgroundImage
        : 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/9556d16312333.5691dd2255721.jpg',
      rating: gameRawg.rating,
      suggestionsCount: gameRawg.suggestionsCount,
      userGame: gameRawg.userGame,
      reviewsCount: gameRawg.reviewsCount,
      genres: [],
      clip: gameRawg.clip, 
      description: gameRawg.description,
      descriptionRaw: gameRawg.descriptionRaw,
      genresDeveloper: genresDeveloper,
      parentPlatforms: parentPlatforms,
      metacritic: gameRawg.metacritic,
      playtime: gameRawg.playtime



      );

    }
}   