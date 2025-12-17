import 'core/constants/exports.dart';

void main() => runZonedGuarded(
  () async {
    await _init();
    runApp(const MyApp());
  },
  (error, stackTrace) {
    logger.e(error.toString());
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
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

  ///! To show the ios status bar widgets.
  // await SystemChrome.setEnabledSystemUIMode(
  //   SystemUiMode.manual,
  //   overlays: [SystemUiOverlay.top],
  // );
  await initDependencies();
  await SvgUtils.preCacheSVGs();
}
