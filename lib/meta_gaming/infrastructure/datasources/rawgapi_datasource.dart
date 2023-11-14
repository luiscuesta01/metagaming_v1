import 'package:dio/dio.dart';
import 'package:metagaming/config/constants/environment.dart';
import 'package:metagaming/meta_gaming/domain/datasources/games_datasource.dart';
import 'package:metagaming/meta_gaming/domain/entities/game.dart';
import 'package:metagaming/meta_gaming/infrastructure/mappers/game_mapper.dart';
import 'package:metagaming/meta_gaming/infrastructure/models/rawg/game_rawg.dart';
import 'package:metagaming/meta_gaming/infrastructure/models/rawg/rawg_response.dart';



class RawgApiDatasource extends GamesDatasource{


  //Instancia de dio con la base de las llamadas y la api key.
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.rawg.io/api',
      queryParameters: {
        'key': Enviroment.rawgKey
      }
    ));


  //Metodos que hacen las llamadas a los diferentes end-points de la api.
  @override
  Future<List<Game>> getNowPlaying({int page = 1}) async{
    
    final response = await dio.get('/games');
    final gameRawgResponse = RawgResponse.fromJson(response.data);

    final List<Game> games = gameRawgResponse.results.map(
      (gameRawg) => GameMapper.gameRawgToEntity(gameRawg)
      ).toList();
      
    return games;
  }



}