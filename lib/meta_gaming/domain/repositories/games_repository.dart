import 'package:metagaming/meta_gaming/domain/entities/game.dart';

abstract class GamesRepository {

  Future <List<Game>> getNowPlaying({int page = 1});

}