import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metagaming/meta_gaming/domain/repositories/cloud_storage_repository.dart';
import 'package:metagaming/meta_gaming/presentation/providers/storage/cloud_storage_provider.dart';

import '../../../domain/entities/game.dart';

final favoriteGamesProvider =
    StateNotifierProvider<StorageGamesNotifier, Map<int, Game>>((ref) {
  final cloudStorageRepository = ref.watch(cloudStorageRepositoryProvider);

  return StorageGamesNotifier(cloudStorageRepository: cloudStorageRepository);
});

//Nuevo contenedor en memoria para todos los juegos que van a estar en favoritos.
class StorageGamesNotifier extends StateNotifier<Map<int, Game>> {
  int page = 0;
  final CloudStorageRepository cloudStorageRepository;

  StorageGamesNotifier({required this.cloudStorageRepository}) : super({});

  Future<List<Game>> loadNextPage() async {
    final games =
        await cloudStorageRepository.loadGames(offset: page * 10, limit: 20);
    page++;

    final tempGamesMap = <int, Game>{};
    for (final game in games) {
      tempGamesMap[game.id] = game;
    }

    state = {...state, ...tempGamesMap};

    return games;
  }

  Future<void> toggleFavorite(Game game) async {
    await cloudStorageRepository.toggleFavorite(game);
    final bool isGameInFavorites = state[game.id] != null;

    if (isGameInFavorites) {
      state.remove(game.id);
      state = {...state};
    } else {
      state = {...state, game.id: game};
    }
  }
}
