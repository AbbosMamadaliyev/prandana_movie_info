import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prandana_movie_info/blocs/auth_bloc/auth_bloc.dart';
import 'package:prandana_movie_info/main_navigation.dart';

import 'app/my_app.dart';
import 'domain/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  UserModel userModel = UserModel();
  final mainNavigation = MainNavigation();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (create) => AuthBloc(),
        ),
        /*StreamProvider<UserModel?>.value(
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
        ),*/
      ],
      child: MyApp(
        initialRoute: await mainNavigation.initialRoute(),
      ),
    ),
  );
}
