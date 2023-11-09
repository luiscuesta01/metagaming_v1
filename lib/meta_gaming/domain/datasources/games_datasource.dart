
import 'package:metagaming/meta_gaming/domain/entities/game.dart';

abstract class GamesDatasource {

  Future <List<Game>> getNowPlaying({int page = 1});

}