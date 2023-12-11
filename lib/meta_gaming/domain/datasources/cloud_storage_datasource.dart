import 'package:metagaming/meta_gaming/domain/entities/game.dart';

abstract class CloudStorageDatasource {
  Future<void> toggleFavorite(Game game);
  Future<bool> isGameFavorite(int gameId);
  Future<List<Game>> loadGames({int limit = 10, offset = 0});
  Future<void> setGameStatus(Game game, String status);
  Future<List<Game>> loadGamesByStatus(String status,
      {int limit = 10, offset = 0});
}
