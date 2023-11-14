import 'package:card_swiper/card_swiper.dart';
import 'package:metagaming/meta_gaming/domain/entities/game.dart';
import 'package:flutter/material.dart';

class GamesSlideShow extends StatelessWidget {
  final List<Game> games;
  const GamesSlideShow({
    super.key,
    required this.games
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 410,
      width: double.infinity,
      
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.8,
        autoplay: true,
        itemCount: games.length,
        itemBuilder: (context, index){
          return _Slide(game: games[index]);
        },

      )
    );
  }
}

class _Slide extends StatelessWidget {
  
  final Game game;


  const _Slide({required this.game});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(60),
      boxShadow: [
        BoxShadow(
          color: Colors.white10,
          blurRadius: 5,
          offset: Offset(0,10)
        )
      ]
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 15),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(65),
          child: Image.network(
            game.backgroundImage,
            fit: BoxFit.cover,
          ))),);
  }
}