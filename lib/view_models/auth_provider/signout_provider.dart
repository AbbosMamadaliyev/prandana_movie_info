import 'package:flutter/cupertino.dart';
import 'package:prandana_movie_info/domain/dataproviders/auth_service/auth_service.dart';

class SignOutProvider extends ChangeNotifier {
  final _authService = AuthService();

  void signOutButton() {
    _authService.logOut();
  }
}
