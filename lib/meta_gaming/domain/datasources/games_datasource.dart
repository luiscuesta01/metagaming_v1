import 'package:metagaming/meta_gaming/domain/entities/game.dart';

import '../entities/screenshots.dart';

abstract class GamesDatasource {
  Future<List<Game>> getNowPlaying({int page = 1});
  Future<List<Game>> getPopular({int page = 1});
  Future<List<Game>> getRecomended({int page = 1});
  Future<Game> getGameById(String id);
  Future<List<Screenshots>> getScreenshotsById(String id);
  Future<List<Game>> searchGames(String query);
}
