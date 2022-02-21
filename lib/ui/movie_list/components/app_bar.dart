import 'package:flutter/material.dart';
import 'package:prandana_movie_info/main_navigation.dart';
import 'package:prandana_movie_info/view_models/auth_provider/signout_provider.dart';
import 'package:provider/src/provider.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Image.asset(
      'assets/images/logo.png',
      height: 20,
    ),
    actions: [
      TextButton(
        onPressed: () {
          context.read<SignOutProvider>().signOutButton();
          Navigator.of(context)
              .pushReplacementNamed(MainNavigationRouteNames.auth);
        },
        child: const Icon(Icons.logout),
      ),
    ],
  );
}
