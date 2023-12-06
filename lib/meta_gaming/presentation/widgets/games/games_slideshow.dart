import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:go_router/go_router.dart';
import 'package:metagaming/meta_gaming/domain/entities/game.dart';
import 'package:flutter/material.dart';

class GamesSlideShow extends StatelessWidget {
 final List<Game> games;
 const GamesSlideShow({super.key, required this.games});

 @override
 Widget build(BuildContext context) {
  final currentSize = MediaQuery.of(context).size;
   final colors = Theme.of(context).colorScheme;
   return SizedBox(
       height: 460,
       width: double.infinity,
       child: Swiper(
         viewportFraction: 0.75,
         scale: 0.75,
         autoplay: true,
         pagination: SwiperPagination(
            
             margin: const EdgeInsets.only(top: 0),
             builder: DotSwiperPaginationBuilder(
               activeColor: colors.primary,
               color: colors.primaryContainer,
             )),
         itemCount: games.length,
         itemBuilder: (context, index) {
           return _Slide(game: games[index]);
         },
       ));
 }
}

class _Slide extends StatelessWidget {
 final Game game;

 const _Slide({required this.game});

 @override
 Widget build(BuildContext context) {
   final decoration =
       BoxDecoration(borderRadius: BorderRadius.circular(60), boxShadow: [
     BoxShadow(color: Colors.white10, blurRadius: 10, offset: Offset(0, 10)),
   ]);
   return Padding(
     padding: const EdgeInsets.only(bottom: 30, top: 15),
     child: DecoratedBox(
         decoration: decoration,
         child: ClipRRect(
             borderRadius: BorderRadius.circular(65),
             child: Stack(fit: StackFit.expand, children: [
               Image.network(
                game.backgroundImage,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black12));
                  }
                  return FadeIn(child: child);
                },
               ),
               GestureDetector(
                onTap: () => context.push('/game/${game.id}'),
                 child: Container(
                  padding: EdgeInsets.only(
                      top: 320, bottom: 30, left: 35, right: 35),
                  child: BlurryContainer(
                    blur: 10,
                    width: 200,
                    height: 200,
                    elevation: 0,
                    color: Colors.black38,
                    padding: const EdgeInsets.all(8),
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 7,),
                                FittedBox(fit: BoxFit.scaleDown,child: Text(game.name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),)),
                                Text(game.reviewsCount.toString()+' sugerencias',style: TextStyle(fontSize: 12, color:Color(0xFFB6B6B6) ) )
                              ],
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ),
                  ),
                 ),
               ),
             ]))),
   );
 }
}
