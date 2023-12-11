import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:metagaming/meta_gaming/presentation/delegates/search_game_delegate.dart';
import 'package:metagaming/meta_gaming/presentation/providers/providers.dart';
import 'package:metagaming/meta_gaming/presentation/widgets/custom_header.dart';

import '../../widgets/custom_appbar.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLastPage = false;
  bool isLoading = false;
  final scrollController = ScrollController();

  @override
  void initState() {
    loadNextPage();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 100 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;

    final games = await ref.read(favoriteGamesProvider.notifier).loadNextPage();
    isLoading = false;

    if (games.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteGames = ref.watch(favoriteGamesProvider).values.toList();
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
        bottom: false,
        child: Column(
          children: [
            CustomAppBar(),
            CustomHeader(
                subtitle: 'Lista de deseos',
                title: 'Favoritos',
                iconShowSearch: true),
            favoriteGames.isEmpty
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Icon(
                        Icons.favorite_border_rounded,
                        size: 60,
                        color: colors.primary,
                      ),
                      Text(
                        'Nos pone triste :(',
                        style: TextStyle(fontSize: 25, color: colors.primary),
                      ),
                      Text(
                        'No tienes juegos favoritos',
                        style: TextStyle(fontSize: 15, color: Colors.white54),
                      ),
                    ],
                  ))
                : Expanded(
                    child: ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: favoriteGames.length,
                        itemBuilder: (context, index) {
                          final games = favoriteGames[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            child: GameItem(
                              game: games,
                              onGameSelected: (context, game) {
                                GoRouter.of(context).go('/game/${game.id}');
                              },
                            ),
                          );
                        }),
                  )
          ],
        ));
  }
}
