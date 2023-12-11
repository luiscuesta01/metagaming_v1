import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metagaming/meta_gaming/presentation/providers/games/games_repository_provider.dart';
import '../../../domain/entities/game.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchedGamesProvider =
    StateNotifierProvider<SearchedGamesNotifier, List<Game>>((ref) {
  final gameRepository = ref.read(gameRepositoryProvider);

  return SearchedGamesNotifier(
      searchGames: gameRepository.searchGames, ref: ref);
});

typedef SearchGamesCallback = Future<List<Game>> Function(String query);

class SearchedGamesNotifier extends StateNotifier<List<Game>> {
  SearchGamesCallback searchGames;
  final Ref ref;

  SearchedGamesNotifier({required this.searchGames, required this.ref})
      : super([]);

  Future<List<Game>> searchGamesByQuery(String query) async {
    final List<Game> games = await searchGames(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = games;

    return games;
  }
}
