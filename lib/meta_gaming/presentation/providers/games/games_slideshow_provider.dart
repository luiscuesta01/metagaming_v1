import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metagaming/meta_gaming/domain/entities/game.dart';
import 'package:metagaming/meta_gaming/presentation/providers/games/games_providers.dart';

final nowPlayingSlideShowProvider = Provider<List<Game>>((ref) {
  final nowPlayingGames = ref.watch(nowPlayingGamesProvider);

  if (nowPlayingGames.isEmpty) return [] ;
  
  return nowPlayingGames.sublist(0,6);
  }  );

final popularGamesSlideShowProvider = Provider<List<Game>>((ref) {
  final popularGames = ref.watch(popularGamesProvider);

  if (popularGames.isEmpty) return [] ;
  
  return popularGames.sublist(0,6);
  }  );

final recommendedGamesSlideShowProvider = Provider<List<Game>>((ref) {
  final recommendedGames = ref.watch(recommendedGamesProvider);

  if (recommendedGames.isEmpty) return [] ;
  
  return recommendedGames.sublist(0,6);
  }  );  