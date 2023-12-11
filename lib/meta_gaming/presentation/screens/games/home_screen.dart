import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:metagaming/meta_gaming/domain/entities/game.dart';
import 'package:metagaming/meta_gaming/presentation/delegates/search_game_delegate.dart';
import 'package:metagaming/meta_gaming/presentation/providers/games/games_providers.dart';
import 'package:metagaming/meta_gaming/presentation/providers/providers.dart';
import 'package:metagaming/meta_gaming/presentation/widgets/widgets.dart';
import 'package:metagaming/shared/widgets/side_menu.dart';

import '../../views/games/home_view.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';
  final Widget childView;

  const HomeScreen({
    Key? key,
    required this.childView,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: widget.childView,
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: CustomBottomNavigationBar(),
      ),
    );
  }
}
