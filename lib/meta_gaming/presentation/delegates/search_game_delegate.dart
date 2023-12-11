import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metagaming/meta_gaming/domain/entities/game.dart';

typedef SearchGamesCallback = Future<List<Game>> Function(String query);

class SearchGameDelegate extends SearchDelegate<Game?> {
  final SearchGamesCallback searchGames;
  List<Game> initialGames;

  StreamController<List<Game>> debouncedGames = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();

  Timer? _debounceTimer;

  SearchGameDelegate({required this.searchGames, required this.initialGames});

  void clearStreams() {
    debouncedGames.close();
  }

  void _onQueryChanged(String query) {
    isLoadingStream.add(true);
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        debouncedGames.add([]);
        return;
      }
      final games = await searchGames(query);
      initialGames = games;
      debouncedGames.add(games);
      isLoadingStream.add(false);
    });
  }

  Widget builResultsAndSuggestions() {
    return StreamBuilder(
        initialData: initialGames,
        stream: debouncedGames.stream,
        builder: (context, snapshot) {
          final games = snapshot.data ?? [];
          return ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                return GameItem(
                  game: games[index],
                  onGameSelected: (context, game) {
                    clearStreams();
                    close(context, game);
                  },
                );
              });
        });
  }

  @override
  String get searchFieldLabel => 'Buscar juego';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
          initialData: false,
          stream: isLoadingStream.stream,
          builder: (context, snapshot) {
            if (snapshot.data ?? false) {
              return SpinPerfect(
                duration: const Duration(seconds: 20),
                spins: 10,
                infinite: true,
                child: IconButton(
                    onPressed: () => query = '',
                    icon: const Icon(Icons.refresh_rounded)),
              );
            }
            return FadeIn(
              animate: query.isNotEmpty,
              duration: const Duration(milliseconds: 200),
              child: IconButton(
                  onPressed: () => query = '', icon: const Icon(Icons.clear)),
            );
          }),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          clearStreams();
          close(context, null);
        },
        icon: Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return builResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);

    return builResultsAndSuggestions();
  }
}

class GameItem extends StatelessWidget {
  final Game game;
  final Function onGameSelected;

  const GameItem({super.key, required this.game, required this.onGameSelected});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final currentSize = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        onGameSelected(context, game);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Container(
              width: currentSize.width * 0.25,
              height: currentSize.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: colors.onBackground
                        .withOpacity(0.1), // Color de la sombra
                    spreadRadius: 2, // Extensión de la sombra
                    blurRadius: 6, // Difuminado de la sombra
                    offset: Offset(0, 2), // Desplazamiento de la sombra
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  game.backgroundImage,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.name,
                    style: textStyle.titleMedium,
                  ),
                  const SizedBox(height: 5), // Agregar un poco de espacio

                  // Fila con íconos de plataformas
                  Row(
                    children: [
                      ...game.parentPlatforms.map((parentPlatform) {
                        IconData? icon =
                            platformIcons[parentPlatform.platform.name];
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
                    ],
                  ),
                  const SizedBox(height: 5), // Agregar un poco de espacio

                  // RatingBarIndicator
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: RatingBarIndicator(
                      rating: game.rating,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 20,
                      unratedColor: Colors.amber.withAlpha(50),
                      direction: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
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
  'Linux': FontAwesomeIcons.linux,
  'Web': FontAwesomeIcons.computer,
  'SEGA': FontAwesomeIcons.s
  // Agrega más plataformas según sea necesario
};
