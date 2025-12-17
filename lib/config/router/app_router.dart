import 'package:sharpvisions_task/app/views/home/home_view.dart';
import 'package:sharpvisions_task/app/views/login/login_view.dart';

import '../../core/constants/exports.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final appRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/${RouteNames.loginView}',
    routes: [
      /// Splash View
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: RouteNames.loginView,
        path: '/${RouteNames.loginView}',
        builder: (_, state) => ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
          child: const LoginView(),
        ),
      ),

      /// Home View
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: RouteNames.homeView,
        path: '/${RouteNames.homeView}',
        builder: (_, state) => const HomeView(),
      ),
    ],
  );
}
