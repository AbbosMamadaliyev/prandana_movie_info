import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:prandana_movie_info/services/movie_list_provider/movie_list_provider.dart';
import 'package:prandana_movie_info/services/popular_actors/popular_actors.dart';
import 'package:prandana_movie_info/ui/movie_list/components/app_bar.dart';
import 'package:prandana_movie_info/ui/movie_list/movie_list_widget.dart';
import 'package:prandana_movie_info/ui/popular_actors/popular_actors_list.dart';
import 'package:provider/src/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int sectionIndex = 0;

  final model = MovieListProvider();
  String locale = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MovieListProvider>().setupLocaleAndLoadData(context);
    context.read<PopularActorsProvider>().setupLocaleAndLoadData(context);
    locale = Localizations.localeOf(context).toLanguageTag();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 23, 55, 1.0),
      appBar: customAppBar(context),
      body: sectionIndex == 0
          ? MovieListWidget(locale: locale)
          : ActorInfoWidget(locale: locale),
      bottomNavigationBar: customNavigationBar(),
    );
  }

  CurvedNavigationBar customNavigationBar() {
    return CurvedNavigationBar(
      items: const [
        Icon(Icons.movie, color: Colors.white),
        Icon(Icons.person, color: Colors.white),
      ],
      index: 0,
      height: 50,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 500),
      color: const Color.fromRGBO(24, 23, 55, 1.0),
      backgroundColor: const Color.fromRGBO(24, 23, 200, 1.0),
      buttonBackgroundColor: const Color.fromRGBO(24, 23, 150, 1.0),
      onTap: (index) {
        setState(() {
          sectionIndex = index;
        });
      },
    );
  }
}
