import 'package:metagaming/meta_gaming/domain/datasources/games_datasource.dart';
import 'package:metagaming/meta_gaming/domain/entities/game.dart';
import 'package:metagaming/meta_gaming/domain/entities/screenshots.dart';
import 'package:metagaming/meta_gaming/domain/repositories/games_repository.dart';

class GameRepositoryImpl extends GamesRepository {

  final GamesDatasource datasource;

  GameRepositoryImpl(this.datasource);

  @override
  Future<List<Game>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
  
  @override
  Future<List<Game>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }
  
  @override
  Future<List<Game>> getRecomended({int page = 1}) {
    return datasource.getRecomended(page: page);
  }
  
  @override
  Future<Game> getGameById(String id) {
    return datasource.getGameById(id);
  }

  @override
  Future<List<Screenshots>> getScreenshotsById(String id) {
    return datasource.getScreenshotsById(id);
  }
  
  @override
  Future<List<Game>> searchGames(String query) {
    return datasource.searchGames(query);
  }

}