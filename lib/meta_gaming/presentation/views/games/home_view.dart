import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:metagaming/meta_gaming/presentation/widgets/custom_header.dart';
import 'package:metagaming/meta_gaming/presentation/widgets/full_screen_loader.dart';

import '../../../domain/entities/game.dart';
import '../../delegates/search_game_delegate.dart';
import '../../providers/providers.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/games/games_slideshow.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  int currentSlideShow = 1;
  int selectedButton = 1;
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingGamesProvider.notifier).loadNextPage();
    ref.read(popularGamesProvider.notifier).loadNextPage();
    ref.read(recommendedGamesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return FullScreenLoader();

    final nowPlayngGamesSlide = ref.watch(nowPlayingGamesProvider);
    final popularGamesSlide = ref.watch(popularGamesProvider);
    final recommendedGamesSlide = ref.watch(recommendedGamesProvider);

    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            const CustomHeader(
                subtitle: 'Explorar', title: 'Juegos', iconShowSearch: true),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 1;
                          currentSlideShow = 1;
                        });
                      },
                      child: Text(
                        'Novedades',
                        style: TextStyle(
                            color: selectedButton == 1
                                ? colors.onBackground
                                : Color(0xFF7B8395)),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 2;
                          currentSlideShow = 2;
                        });
                      },
                      child: Text(
                        'Populares',
                        style: TextStyle(
                            color: selectedButton == 2
                                ? colors.onBackground
                                : Color(0xFF7B8395)),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 3;
                          currentSlideShow = 3;
                        });
                      },
                      child: Text(
                        'Recomendados',
                        style: TextStyle(
                            color: selectedButton == 3
                                ? colors.onBackground
                                : Color(0xFF7B8395)),
                      ))
                ],
              ),
            ),
            if (currentSlideShow == 1)
              GamesSlideShow(games: nowPlayngGamesSlide),
            if (currentSlideShow == 2) GamesSlideShow(games: popularGamesSlide),
            if (currentSlideShow == 3)
              GamesSlideShow(games: recommendedGamesSlide),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
