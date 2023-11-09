import 'package:metagaming/meta_gaming/domain/datasources/games_datasource.dart';
import 'package:metagaming/meta_gaming/domain/entities/game.dart';
import 'package:metagaming/meta_gaming/domain/repositories/games_repository.dart';

class GameRepositoryImpl extends GamesRepository {

  final GamesDatasource datasource;

  GameRepositoryImpl(this.datasource);

  @override
  Future<List<Game>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

}