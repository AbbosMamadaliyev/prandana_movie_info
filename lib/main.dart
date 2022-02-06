import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:prandana_movie_info/main_navigation.dart';
import 'package:prandana_movie_info/services/auth_provider/signin_provider.dart';
import 'package:prandana_movie_info/services/auth_provider/signout_provider.dart';
import 'package:prandana_movie_info/services/auth_provider/signup_provider.dart';
import 'package:prandana_movie_info/services/auth_service/auth_service.dart';
import 'package:prandana_movie_info/services/credits_provider/movie_list_provider.dart';
import 'package:prandana_movie_info/services/keywords_movies/keywords_movies.dart';
import 'package:prandana_movie_info/services/movie_deails_provider/movie_details_provider.dart';
import 'package:prandana_movie_info/services/movie_list_provider/movie_list_provider.dart';
import 'package:prandana_movie_info/services/popular_actors/popular_actors.dart';
import 'package:prandana_movie_info/services/videos_provider/videos_provider.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  UserModel userModel = UserModel();
  final mainNavigation = MainNavigation();

  runApp(
    MultiProvider(
      providers: [
        StreamProvider<UserModel?>.value(
          value: AuthService().currentUser,
          initialData: userModel,
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => PopularActorsProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => SignUpProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => SignOutProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => MovieListProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => VideosProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => MovieDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => KeywordsProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CreditsProvider(),
        ),
      ],
      child: MyApp(
        initialRoute: await mainNavigation.initialRoute(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp({Key? key, required this.initialRoute}) : super(key: key);

  final mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('en', 'US'),
      ],
      initialRoute: initialRoute,
      routes: mainNavigation.routes,
    );
  }
}
