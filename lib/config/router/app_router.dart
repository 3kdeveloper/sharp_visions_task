import 'package:sharpvisions_task/app/view_models/home/home_view_model.dart';
import 'package:sharpvisions_task/app/views/home/home_view.dart';
import 'package:sharpvisions_task/app/views/login/login_view.dart';

import '../../core/constants/exports.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

// final token = await locator<SecureStorageService>().read(CommonKeys.token);

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
        builder: (_, state) => ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
          child: const HomeView(),
        ),
      ),
    ],
  );
}
