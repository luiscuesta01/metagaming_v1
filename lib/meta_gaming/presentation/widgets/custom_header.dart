import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/game.dart';
import '../delegates/search_game_delegate.dart';
import '../providers/providers.dart';

class CustomHeader extends ConsumerWidget {
 
 final String subtitle;
 final String title;
 final bool iconShowSearch;
 
 const CustomHeader({
  Key? key, 
  required this.subtitle, 
  required this.title, 
  required this.iconShowSearch,
 }) : super(key: key);

 @override
 Widget build(BuildContext context, WidgetRef ref) {
  return Column(
    children: [
      Padding(
        padding:const  EdgeInsets.only(left: 25.0, top: 2),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 14, color: Color(0xFF7B8395)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
        child: Row(
          children: [
            Text(
             title,
             style: const TextStyle(
                fontSize: 30,
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.w700),
            ), 
            const Spacer(),
            iconShowSearch == true ?
            IconButton(onPressed: () {

             final searchedGames = ref.read(searchedGamesProvider);
             final searchQuery = ref.read(searchQueryProvider);

             showSearch<Game?>(
              query:searchQuery ,
              context: context, 
             delegate:SearchGameDelegate(
              initialGames: searchedGames,
              searchGames:ref.read(searchedGamesProvider.notifier).searchGamesByQuery
             )
             ).then((game) {
              if (game == null) return;
              context.push('/game/${game.id}');
             });
            }, 
            icon: const Icon(Icons.search_rounded, color: Color(0xFF7B8395), size: 33,))
            : const SizedBox()
          ],
        ),
      ),
    ],
  );
 }
}

