import 'package:dio/dio.dart';
import 'package:metagaming/config/constants/environment.dart';
import 'package:metagaming/meta_gaming/domain/datasources/games_datasource.dart';
import 'package:metagaming/meta_gaming/domain/entities/game.dart';
import 'package:metagaming/meta_gaming/domain/entities/screenshots.dart';
import 'package:metagaming/meta_gaming/infrastructure/mappers/game_mapper.dart';
import 'package:metagaming/meta_gaming/infrastructure/mappers/screenshots_mapper.dart';
import 'package:metagaming/meta_gaming/infrastructure/models/rawg/game_rawg.dart';
import 'package:metagaming/meta_gaming/infrastructure/models/rawg/rawg_response.dart';
import 'package:intl/intl.dart';
import 'package:metagaming/meta_gaming/infrastructure/models/rawg/screenshots_rawg.dart';

import '../models/rawg/models.dart';

class RawgApiDatasource extends GamesDatasource {
  //Instancia de dio con la base de las llamadas y la api key.
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.rawg.io/api',
      queryParameters: {'key': Environment.rawgKey}));

  List<Game> _jsonToGames(Map<String, dynamic> json) {
    final gameRawgResponse = RawgResponse.fromJson(json);

    final List<Game> games = gameRawgResponse.results
        .map((gameRawg) => GameMapper.gameRawgToEntity(gameRawg))
        .toList();

    return games;
  }

  //Metodos que hacen las llamadas a los diferentes end-points de la api.
  @override
  Future<List<Game>> getNowPlaying({int page = 1}) async {
    DateTime now = DateTime.now();
    DateTime startOfLastMonth = DateTime(now.year, now.month - 1, 1);
    DateTime endOfLastMonth = DateTime(now.year, now.month, 0);

    String startDate = DateFormat('yyyy-MM-dd').format(startOfLastMonth);
    String endDate = DateFormat('yyyy-MM-dd').format(endOfLastMonth);

    String datesParam = '$startDate,$endDate';

    final response = await dio.get('/games?dates=$datesParam&page_size=10');

    return _jsonToGames(response.data);
  }

  @override
  Future<List<Game>> getPopular({int page = 1}) async {
    final response = await dio.get('/games?page_size=10');

    return _jsonToGames(response.data);
  }

  @override
  Future<List<Game>> getRecomended({int page = 1}) async {
    final response = await dio
        .get('/games?page_size=10&ordering=-released&metacritic=95,100');

    return _jsonToGames(response.data);
  }

  @override
  Future<Game> getGameById(String id) async {
    final response = await dio.get('/games/$id');
    if (response.statusCode != 200)
      throw Exception('El juego con id: $id no esta disponible.');

    final gameDetails = GameDetails.fromJson(response.data);
    final Game game = GameMapper.gameDetailsToEntity(gameDetails);
    return game;
  }

  @override
  Future<List<Screenshots>> getScreenshotsById(String id) async {
    final response = await dio.get('/games/$id/screenshots');
    if (response.statusCode != 200)
      throw Exception('El juego con id: $id no tiene capturas.');

    final screenshotsResponse = ResponseScreenshots.fromJson(response.data);
    final List<Screenshots> screenshots = screenshotsResponse.results
        .map((screenshotRawg) =>
            ScreenshotsMapper.screenshotsRawgToEntity(screenshotRawg))
        .toList();
    return screenshots;
  }

  @override
  Future<List<Game>> searchGames(String query) async {
    if (query.isEmpty) return [];

    final response =
        await dio.get('/games', queryParameters: {'search': query});

    return _jsonToGames(response.data);
  }
}
