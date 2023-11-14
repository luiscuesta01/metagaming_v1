import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metagaming/meta_gaming/domain/entities/game.dart';
import 'package:metagaming/meta_gaming/presentation/providers/games/games_providers.dart';

final gamesSlideShowProvider = Provider<List<Game>>((ref) {
  final nowPlayingGames = ref.watch(nowPlayingGamesProvider);

  if (nowPlayingGames.isEmpty) return [] ;
  
  return nowPlayingGames.sublist(0,6);
  }  );