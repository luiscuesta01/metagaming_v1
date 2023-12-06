import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metagaming/meta_gaming/presentation/providers/games/games_providers.dart';
import 'package:metagaming/meta_gaming/presentation/providers/providers.dart';
import 'package:metagaming/meta_gaming/presentation/widgets/widgets.dart';


class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
        body: _HomeView(colors: colors),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: const CustomBottomNavigationBar(),
        ));
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
    required this.colors,
  });

  final ColorScheme colors;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
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

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return  FullScreenLoader();

    final nowPlayngGamesSlide = ref.watch(nowPlayingGamesProvider);
    final popularGamesSlide = ref.watch(popularGamesProvider);
    final recommendedGamesSlide = ref.watch(recommendedGamesProvider);
    
    

    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: widget.colors.primary, width: 1)),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://viclisreus.files.wordpress.com/2017/10/aaa.jpg'),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'luiscr_01',
                        style:
                            TextStyle(color: Color(0xFF7B8395), fontSize: 12),
                      ),
                      Row(
                        children: [
                          Text(
                            'Hey, Luis !',
                            style: TextStyle(fontSize: 14),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Icon(
                              Icons.mouse_outlined,
                              size: 13,
                              color: Color(0xFF7B8395),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFF393F4B), width: 1)),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.gamepad_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 2),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Explorar',
                  style: TextStyle(fontSize: 14, color: Color(0xFF7B8395)),
                )),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
            child: Row(
              children: [
                Text(
                  'Juegos',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'NotoSans',
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
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
                      style: TextStyle(color: selectedButton == 1 ? widget.colors.onBackground : Color(0xFF7B8395)),
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
                      style: TextStyle(color: selectedButton == 2 ? widget.colors.onBackground : Color(0xFF7B8395)),
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
                      style: TextStyle(color: selectedButton == 3 ? widget.colors.onBackground : Color(0xFF7B8395)),
                    ))
              ],
            ),
          ),

          if (currentSlideShow == 1) GamesSlideShow(games: nowPlayngGamesSlide),
          if (currentSlideShow == 2) GamesSlideShow(games: popularGamesSlide),
          if (currentSlideShow == 3) GamesSlideShow(games: recommendedGamesSlide)
        ],
      ),
    ));
  }
}
