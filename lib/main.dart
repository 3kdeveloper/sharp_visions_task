import 'package:fast_cached_network_image/fast_cached_network_image.dart';

import 'core/constants/exports.dart';

void main() => runZonedGuarded(
  () async {
    await _init();
    runApp(const MyApp());
  },
  (error, stackTrace) {
    logger.e(error.toString());
  },
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: ConstantsResource.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      routerConfig: locator<AppRouter>().appRouter,
    );
  }
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await FastCachedImageConfig.init();

  // await locator<SecureStorageService>().clear();
}
