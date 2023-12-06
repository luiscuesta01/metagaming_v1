import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metagaming/meta_gaming/presentation/providers/games/games_repository_provider.dart';

import '../../../domain/entities/game.dart';


final gameInfoProvider = StateNotifierProvider<GameMapNotifier, Map<String,Game>>((ref) {
  
 final gameRepository = ref.watch(gameRepositoryProvider);
  
  return GameMapNotifier(getGame:gameRepository.getGameById);
});


/*Aqui construyo un mapa donde asocio cada id a cada juego,
  para poder guardar el juego que ya se ha cargado en cache y así
  ahorrarnos volver a cargar el mismo juego*/


typedef GetGameCallback = Future<Game>Function(String gameId);

class GameMapNotifier extends StateNotifier<Map<String,Game>> {
  
  final GetGameCallback getGame;
  
   GameMapNotifier({
    required this.getGame
   }): super({});

   Future<void> loadGame(String gameId)async{
    if (state[gameId] != null) return;
    print('realizando peticion http.');
    final game = await getGame(gameId);

    state = {...state, gameId: game};
   }
}