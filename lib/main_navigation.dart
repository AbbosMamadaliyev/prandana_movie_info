import 'package:flutter/material.dart';
import 'package:prandana_movie_info/ui/auth/auth_widget.dart';
import 'package:prandana_movie_info/ui/auth/login_page/login_page.dart';
import 'package:prandana_movie_info/ui/auth/signup_page/signup_page.dart';
import 'package:prandana_movie_info/ui/main_screen/main_screen.dart';
import 'package:prandana_movie_info/ui/movie_details/movie_details_widget.dart';
import 'package:prandana_movie_info/ui/popular_actors/played_movies.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MainNavigationRouteNames {
  static const splashScreen = '/splash_screen';
  static const auth = '/auth';
  static const signUp = '/auth/sign_up';
  static const login = '/login';
  static const movieList = '/movie_list';
  static const movieDetails = '/movie_details';
  static const mainScreen = '/main_screen';
  static const castingMovies = '/casting_movies';
}

class MainNavigation {
  Future<String> initialRoute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogIn = prefs.getBool('is_login_in') ?? false;
    return isLogIn
        ? MainNavigationRouteNames.mainScreen
        : MainNavigationRouteNames.auth;
  }

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (context) => const AuthWidget(),
    MainNavigationRouteNames.signUp: (context) => const SignupPage(),
    MainNavigationRouteNames.login: (context) => const LoginPage(),
    MainNavigationRouteNames.mainScreen: (context) => const MainScreen(),
    MainNavigationRouteNames.movieDetails: (context) =>
        const MovieDetailsWidget(),
    MainNavigationRouteNames.castingMovies: (context) {
      final arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      final index = arguments['index'];
      final locale = arguments['locale'];

      if (index is int) {
        return PlayedMoviesWidget(
          actorIndex: index,
          locale: locale,
        );
      } else {
        return PlayedMoviesWidget(
          actorIndex: 1,
          locale: locale,
        );
      }
    },
  };
}
