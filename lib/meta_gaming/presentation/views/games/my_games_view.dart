import 'package:flutter/material.dart';
import 'package:metagaming/meta_gaming/presentation/widgets/custom_header.dart';

import '../../widgets/custom_appbar.dart';

class MyGamesView extends StatelessWidget {
  const MyGamesView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
              CustomHeader(
                  subtitle: 'Jugados',
                  title: 'Mis juegos',
                  iconShowSearch: true),
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Icon(
                    Icons.videogame_asset_rounded,
                    size: 60,
                    color: colors.primary,
                  ),
                  Text(
                    'Nos pone triste :(',
                    style: TextStyle(fontSize: 25, color: colors.primary),
                  ),
                  Text(
                    'No tienes juegos guardados',
                    style: TextStyle(fontSize: 15, color: Colors.white54),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}
