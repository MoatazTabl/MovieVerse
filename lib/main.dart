import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movieverse/core/utils/app_router.dart';
import 'package:movieverse/core/utils/app_service.dart';
import 'package:movieverse/core/utils/hive/hive_fav_movies.dart';
import 'package:movieverse/core/utils/hive/hive_user_data.dart';
import 'package:movieverse/core/utils/observer.dart';
import 'package:movieverse/core/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movieverse/features/Auth/Presentation/Manager/login_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  Future.wait([
    dotenv.load(fileName: "lib/.env"),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
  ]);

  await initDataBase();

  runApp(const MyApp());
}

Future<void> initDataBase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FavMoviesAdapter());
  await Hive.openBox<FavMovies>("MovieFav");
  Hive.registerAdapter(UserDataAdapter());
  await Hive.openBox("darkModeSwitch");
  await Hive.openBox('App Service Box');
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AppService.instance.initialize();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: ValueListenableBuilder(
        valueListenable: Hive.box("darkModeSwitch").listenable(),
        builder: (BuildContext context, value, Widget? child) {
          var darkMode = value.get("darkMode", defaultValue: false);
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (
              context,
              child,
            ) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'MovieVerse',
                routerConfig: AppRouter.router,
                theme: darkMode ? AppThemes.darkTheme : AppThemes.lightTheme,
              );
            },
          );
        },
      ),
    );
  }
}
