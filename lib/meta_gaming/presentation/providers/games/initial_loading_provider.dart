import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metagaming/meta_gaming/presentation/providers/games/games_providers.dart';

final initialLoadingProvider = Provider<bool>((ref){
 final step1 = ref.watch(nowPlayingGamesProvider).isEmpty;
    final step2 = ref.watch(popularGamesProvider).isEmpty;
    final step3 = ref.watch(recommendedGamesProvider).isEmpty;

  if (step1 || step2 || step3) return true; 
  return false;
});