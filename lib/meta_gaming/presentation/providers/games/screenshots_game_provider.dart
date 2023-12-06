import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metagaming/meta_gaming/domain/entities/screenshots.dart';
import 'package:metagaming/meta_gaming/presentation/providers/games/games_repository_provider.dart';



final screenshotsGameProvider = StateNotifierProvider<ScreenshotsMapNotifier, Map<String,List<Screenshots>>>((ref) {
  
 final gameRepository = ref.watch(gameRepositoryProvider);
  
  return ScreenshotsMapNotifier(getGameScreenshots:gameRepository.getScreenshotsById);
});


/*Aqui construyo un mapa donde asocio cada id a cada juego,
  para poder guardar el juego que ya se ha cargado en cache y así
  ahorrarnos volver a cargar el mismo juego*/


typedef ScreenshotsCallback = Future<List<Screenshots>> Function(String gameId);

class ScreenshotsMapNotifier extends StateNotifier<Map<String,List<Screenshots>>> {
  
  final ScreenshotsCallback getGameScreenshots;
  
   ScreenshotsMapNotifier({
    required this.getGameScreenshots
   }): super({});

   Future<void> loadGameScreenshots(String gameId)async{
    if (state[gameId] != null) return;
    print('realizando peticion http.');
    final screenshots = await getGameScreenshots(gameId);

    state = {...state, gameId: screenshots};
   }
}