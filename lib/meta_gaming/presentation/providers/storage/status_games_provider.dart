import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metagaming/meta_gaming/domain/repositories/cloud_storage_repository.dart';
import 'package:metagaming/meta_gaming/presentation/providers/storage/cloud_storage_provider.dart';

import '../../../domain/entities/game.dart';

final statusGamesProvider =
    StateNotifierProvider<StorageStatusGamesNotifier, Map<int, Game>>((ref) {
  final cloudStorageRepository = ref.watch(cloudStorageRepositoryProvider);

  return StorageStatusGamesNotifier(
      cloudStorageRepository: cloudStorageRepository);
});

class StorageStatusGamesNotifier extends StateNotifier<Map<int, Game>> {
  int page = 0;
  final CloudStorageRepository cloudStorageRepository;

  StorageStatusGamesNotifier({required this.cloudStorageRepository})
      : super({});

  Future<List<Game>> loadNextPage(String status) async {
    final games = await cloudStorageRepository.loadGamesByStatus(status,
        offset: page * 10, limit: 20);
    page++;

    final tempGamesMap = <int, Game>{};
    for (final game in games) {
      tempGamesMap[game.id] = game;
    }

    state = {...state, ...tempGamesMap};

    return games;
  }

  Future<void> toggleFavorite(Game game, String status) async {
    await cloudStorageRepository.setGameStatus(game, status);
    final bool isGameInStatus = state[game.id] != null;

    if (isGameInStatus) {
      state.remove(game.id);
      state = {...state};
    } else {
      state = {...state, game.id: game};
    }
  }
}
