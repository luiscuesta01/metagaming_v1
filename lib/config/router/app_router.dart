import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:metagaming/auth/auth.dart';
import 'package:metagaming/auth/presentation/providers/auth_provider.dart';
import 'package:metagaming/config/router/app_router_notifier.dart';
import 'package:metagaming/meta_gaming/presentation/screens/games/custom_drawer.dart';

import '../../meta_gaming/presentation/screens/screens.dart';
import '../../meta_gaming/presentation/views/views.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionAKey = GlobalKey<NavigatorState>(debugLabel: 'sectionA');
final _sectionBKey = GlobalKey<NavigatorState>(debugLabel: 'sectionB');
final _sectionCKey = GlobalKey<NavigatorState>(debugLabel: 'sectionC');

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);
  return GoRouter(
    initialLocation: '/login',
    refreshListenable: goRouterNotifier,
    routes: [
      GoRoute(
        path: '/login',
        name: 'login-screen',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register-screen',
        builder: (context, state) => const RegisterScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(childView: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: ((context, state) {
                  return const HomeView();
                }),
                routes: [
                  GoRoute(
                    path: 'game/:id',
                    name: GameScreen.name,
                    builder: (context, state) {
                      final gameId = state.pathParameters['id'] ?? 'no-id';
                      return GameScreen(
                        gameId: gameId,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/my-games',
                builder: ((context, state) {
                  return const MyGamesView();
                }),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorites',
                builder: ((context, state) {
                  return const FavoritesView();
                }),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/about-us',
                builder: ((context, state) {
                  return const AboutUsView();
                }),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/drawer',
                builder: ((context, state) {
                  return const CustomDrawer();
                }),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;
      //Muestro por consola el estado de auth y donde quiero ir
      print(' authStatus: $authStatus, isGoingTo: $isGoingTo');

      if (isGoingTo == '/splash' && authStatus == AuthStatus.checking)
        return null;

      if (authStatus == AuthStatus.notAuthenticated) {
        if (isGoingTo == '/login' || isGoingTo == '/register') return null;

        return '/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/splash') {
          return '/';
        }
      }

      return null;
    },
  );
});
