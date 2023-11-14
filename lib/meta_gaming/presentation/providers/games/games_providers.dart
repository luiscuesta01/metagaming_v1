
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metagaming/meta_gaming/domain/entities/game.dart';
import 'package:metagaming/meta_gaming/presentation/providers/games/games_repository_provider.dart';

//Mantener un estado de juegos.

//Saber cuales son los juegos que me tengo que traer, un StateNotifierProvider.
final nowPlayingGamesProvider = StateNotifierProvider<GamesNotifier, List<Game>>((ref) {
  
  final fetchMoreGames = ref.watch(gameRepositoryProvider).getNowPlaying;
  
  return GamesNotifier(
    fetchMoreGames: fetchMoreGames
  );
});

typedef GameCallback = Future<List<Game>> Function({int page});


//Clase generica para mantener un estado de los juegos (lista de juegos).
class GamesNotifier extends StateNotifier<List<Game>> {
  
  int currentPage = 0;
  GameCallback fetchMoreGames;



  GamesNotifier({
    required this.fetchMoreGames
  }): super([]);


  //Funcion que carga la siguiente pagina de juegos y las mantiene en memoria.
  Future<void> loadNextPage() async{
    
    currentPage++;

    final List<Game> games = await fetchMoreGames(page:currentPage);
    state = [...state, ...games];
    

  }

}