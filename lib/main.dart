import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prandana_movie_info/domain/dataproviders/auth_service/auth_service.dart';
import 'package:prandana_movie_info/main_navigation.dart';
import 'package:prandana_movie_info/view_models/auth_provider/signin_provider.dart';
import 'package:prandana_movie_info/view_models/auth_provider/signout_provider.dart';
import 'package:prandana_movie_info/view_models/auth_provider/signup_provider.dart';
import 'package:prandana_movie_info/view_models/credits_provider/movie_list_provider.dart';
import 'package:prandana_movie_info/view_models/keywords_movies/keywords_movies.dart';
import 'package:prandana_movie_info/view_models/movie_deails_provider/movie_details_provider.dart';
import 'package:prandana_movie_info/view_models/movie_list_provider/movie_list_provider.dart';
import 'package:prandana_movie_info/view_models/popular_actors/popular_actors.dart';
import 'package:prandana_movie_info/view_models/videos_provider/videos_provider.dart';
import 'package:provider/provider.dart';

import 'domain/models/user.dart';
import 'my_app.dart';

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
