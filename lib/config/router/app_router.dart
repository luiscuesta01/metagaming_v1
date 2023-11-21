import 'package:go_router/go_router.dart';
import 'package:metagaming/auth/auth.dart';

import '../../meta_gaming/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()
    ),
    GoRoute(
      path: '/login',
      name: 'login-screen',
      builder: (context, state) => const LoginScreen()
      
    )
  ]
);
