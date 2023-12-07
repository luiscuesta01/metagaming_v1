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
      
    ),

    GoRoute(
      path: '/register',
      name: 'register-screen',
      builder: (context, state) => const RegisterScreen(),
      ),

    GoRoute(
      path: '/game/:id',
      name: GameScreen.name,
      builder: (context, state) {
        final gameId = state.pathParameters['id'] ?? 'no-id';
        
        return GameScreen(gameId: gameId,);
        } ,
    ),
  ]
);
