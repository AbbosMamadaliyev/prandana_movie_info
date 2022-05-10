import 'package:flutter/cupertino.dart';
import 'package:prandana_movie_info/domain/dataproviders/auth_service/auth_service.dart';
import 'package:prandana_movie_info/main_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier {
  final _authService = AuthService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? _loginErrorMessage;
  String? get loginErrorMessage => _loginErrorMessage;

  bool _isAuthProgress = false;
  bool get isAuthProgress => _isAuthProgress;
  bool get canStartAuth => !_isAuthProgress;

  void loginButtonAction(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _loginErrorMessage = '- Заполните поля';
      notifyListeners();
      return;
    }
    _loginErrorMessage = null;
    _isAuthProgress = true;
    print('sorov yuborildi: $_isAuthProgress');
    notifyListeners();

    final userModel = await _authService.signinWithEmailAndPass(
      email.trim(),
      password.trim(),
    );

    _isAuthProgress = false;
    print('javob keldi: $_isAuthProgress');
    notifyListeners();

    if (userModel == null) {
      _loginErrorMessage =
          '- Ошибка электронной почты или пароля! \n Если вы посещаете сайт впервые, пожалуйста, зарегистрируйтесь.';
      notifyListeners();
    } else {
      _saveLogin();
      Navigator.pushReplacementNamed(
          context, MainNavigationRouteNames.mainScreen);
      _isAuthProgress = false;
      emailController.clear();
      passwordController.clear();
      notifyListeners();
    }
  }

  void _saveLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_login_in', true);
  }
}
