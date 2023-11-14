import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metagaming/config/constants/environment.dart';
import 'package:metagaming/meta_gaming/presentation/components/animated_bar.dart';
import 'package:metagaming/meta_gaming/presentation/providers/games/games_providers.dart';
import 'package:metagaming/meta_gaming/presentation/screens/utils/rive_utils.dart';
import 'package:metagaming/meta_gaming/presentation/widgets/games/games_slideshow.dart';
import 'package:rive/rive.dart';

import '../../../domain/entities/rive_asset.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  RiveAsset selectedBottomNav = bottomNavs.first;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: _HomeView(colors: colors),
      bottomNavigationBar: SafeArea(
          child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            color: colors.primaryContainer,
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
                bottomNavs.length,
                (index) => GestureDetector(
                      onTap: () {
                        bottomNavs[index].input!.change(true);
                        if (bottomNavs[index] != selectedBottomNav) {
                          setState(() {
                            selectedBottomNav = bottomNavs[index];
                          });
                        }
                        Future.delayed(const Duration(seconds: 1), () {
                          bottomNavs[index].input!.change(false);
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedBar(
                              isActive: bottomNavs[index] == selectedBottomNav,
                              colors: colors),
                          SizedBox(
                            height: 36,
                            width: 36,
                            child: Opacity(
                              opacity: bottomNavs[index] == selectedBottomNav
                                  ? 1
                                  : 0.5,
                              child: RiveAnimation.asset(
                                bottomNavs.first.src,
                                artboard: bottomNavs[index].artboard,
                                onInit: (artboard) {
                                  StateMachineController controller =
                                      RiveUtils.getRiveController(artboard,
                                          stateMachineName: bottomNavs[index]
                                              .stateMachineName);
                                  bottomNavs[index].input =
                                      controller.findSMI("active") as SMIBool;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
          ],
        ),
      )),
    );
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
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingGamesProvider.notifier).loadNextPage();
  }
  @override
  Widget build(BuildContext context) {
    final nowPlayingGames= ref.watch(nowPlayingGamesProvider);
    return SafeArea(
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
                      border: Border.all(color: widget.colors.primary, width: 1)),
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
          padding:  EdgeInsets.only(left: 25.0, top: 2),
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
                  onPressed: () {},
                  child: Text(
                    'Populares',
                    style: TextStyle(color: widget.colors.onBackground),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Novedades',
                    style: TextStyle(color: Color(0xFF7B8395)),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Recomendados',
                    style: TextStyle(color: Color(0xFF7B8395)),
                  ))
            ],
          ),
        ),
        GamesSlideShow(games: nowPlayingGames)
      ],
    ));
  }
}
