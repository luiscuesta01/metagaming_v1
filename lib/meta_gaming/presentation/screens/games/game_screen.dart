import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:metagaming/meta_gaming/domain/entities/screenshots.dart';
import 'package:metagaming/meta_gaming/infrastructure/models/rawg/game_rawg.dart';
import 'package:metagaming/meta_gaming/presentation/providers/games/game_info_provider.dart';
import 'package:metagaming/meta_gaming/presentation/providers/games/screenshots_game_provider.dart';

import '../../../domain/entities/game.dart';

class GameScreen extends ConsumerStatefulWidget {
  static const name = 'game-screen';

  final String gameId;

  const GameScreen({super.key, required this.gameId});

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends ConsumerState<GameScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(gameInfoProvider.notifier).loadGame(widget.gameId);
    ref
        .read(screenshotsGameProvider.notifier)
        .loadGameScreenshots(widget.gameId);
  }

  @override
  Widget build(BuildContext context) {
    final Game? game = ref.watch(gameInfoProvider)[widget.gameId];
    final List<Screenshots>? screenshots =
        ref.watch(screenshotsGameProvider)[widget.gameId];

    if (game == null) {
      return const Scaffold(
          body: Center(
              child: CircularProgressIndicator(
        strokeWidth: 2,
      )));
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(game: game),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _GameDetails(
                        game: game,
                        screenshots: screenshots,
                      ),
                  childCount: 1))
        ],
      ),
    );
  }
}

class _GameDetails extends StatelessWidget {
  final Game game;
  final List<Screenshots>? screenshots;
  const _GameDetails({required this.game, this.screenshots});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final currentSize = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    String formattedDate = DateFormat('MMM dd, yyyy').format(game.released);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HeaderGame(colors: colors, formattedDate: formattedDate, game: game),
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 10),
          child: Divider(
            color: colors.onBackground.withOpacity(0.2),
          ),
        ),
        _ScreenshotsSlide(currentSize: currentSize, screenshots: screenshots),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Descripción',
                style: textStyle.headlineSmall,
              ),
              SizedBox(
                height: 2,
              ),
              Text(game.descriptionRaw),
            ],
          ),
        )
      ],
    );
  }
}

class _ScreenshotsSlide extends StatelessWidget {
  const _ScreenshotsSlide({
    super.key,
    required this.currentSize,
    required this.screenshots,
  });

  final Size currentSize;
  final List<Screenshots>? screenshots;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: currentSize.height * 0.30, // Adjust the height as needed
      child: PageView.builder(
        itemCount: screenshots?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(10),
               // Adjust the radius as needed
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 7,
                  offset: const Offset(0, 5),
                ),
              ],
                ),
                width: currentSize.width, // Adjust the width as needed
                child: Image.network(
                  screenshots![index].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HeaderGame extends StatelessWidget {
  const _HeaderGame({
    super.key,
    required this.colors,
    required this.formattedDate,
    required this.game,
  });

  final ColorScheme colors;
  final String formattedDate;
  final Game game;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final gamePlayTime = game.playtime;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 23),
      child: Column(
        children: [
          
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Text(
                    game.name,
                    style: textStyle.headlineLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              IconButton(
                iconSize: 27,
                color: colors.primary,
                onPressed: () {},
                icon: Icon(Icons.favorite_border_rounded),
              ),
            ],
          ),
          const SizedBox(height: 5),

          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: colors.onBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  formattedDate,
                  style: TextStyle(
                    color: colors.background,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              ...game.parentPlatforms.map((parentPlatform) {
                IconData? icon = platformIcons[parentPlatform.platform.name];
                if (icon != null) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Icon(
                      icon,
                      size: 16,
                    ),
                  );
                } else {
                  return Icon(Icons.help);
                }
              }).toList(),
              Spacer(),
              game.metacritic != 0 ? // o Expanded() aquí para ocupar el espacio restante
              Container(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: game.metacritic > 75 ? Colors.green : Colors.orange,
                  ),
                ),
                child: Text(
                  game.metacritic.toString(),
                  style: TextStyle(
                    color: game.metacritic > 75 ? Colors.green : Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ):const SizedBox()
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('AVERAGE PLAYTIME: $gamePlayTime HOURS')),
          )
        ],
      ),
    );
  }
}


class _CustomSliverAppBar extends StatelessWidget {
  final Game game;

  const _CustomSliverAppBar({required this.game});

  @override
  Widget build(BuildContext context) {
    final currentSize = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: currentSize.height * 0.33,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                game.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.7, 1.0],
                          colors: [Colors.transparent, Colors.black87]))),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.topLeft, stops: [
                0.0,
                0.20
              ], colors: [
                Colors.black87,
                Colors.transparent,
              ]))),
            )
          ],
        ),
      ),
    );
  }
}

final Map<String, IconData> platformIcons = {
  'PC': FontAwesomeIcons.windows,
  'PlayStation': FontAwesomeIcons.playstation,
  'Xbox': FontAwesomeIcons.xbox,
  'Nintendo': FontAwesomeIcons.n,
  'iOS': FontAwesomeIcons.apple,
  'Android': FontAwesomeIcons.android,
  'Apple Macintosh': FontAwesomeIcons.apple,
  'Linux': FontAwesomeIcons.linux
  // Agrega más plataformas según sea necesario
};
