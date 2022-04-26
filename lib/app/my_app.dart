import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../main_navigation.dart';

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
