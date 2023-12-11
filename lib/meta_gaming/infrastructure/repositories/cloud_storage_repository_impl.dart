import 'package:metagaming/meta_gaming/domain/datasources/cloud_storage_datasource.dart';
import 'package:metagaming/meta_gaming/domain/entities/game.dart';
import 'package:metagaming/meta_gaming/domain/repositories/cloud_storage_repository.dart';

class CloudStorageRepositoryImpl extends CloudStorageRepository {
  final CloudStorageDatasource datasource;
  CloudStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isGameFavorite(int gameId) {
    return datasource.isGameFavorite(gameId);
  }

  @override
  Future<List<Game>> loadGames({int limit = 10, offset = 0}) {
    return datasource.loadGames(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Game game) {
    return datasource.toggleFavorite(game);
  }

  @override
  Future<List<Game>> loadGamesByStatus(String status,
      {int limit = 10, offset = 0}) {
    return datasource.loadGamesByStatus(status, limit: limit, offset: offset);
  }

  @override
  Future<void> setGameStatus(Game game, String status) {
    return datasource.setGameStatus(game, status);
  }
}
