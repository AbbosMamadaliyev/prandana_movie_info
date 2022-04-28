import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/dataproviders/auth_service/auth_service.dart';
import '../../domain/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authService = AuthService();

  AuthBloc(AuthState initialState) : super(initialState) {
    /// check auth status
    on<AuthCheckStatusEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLogIn = prefs.getBool('is_login_in') ?? false;

      final newState =
          isLogIn ? AuthAuthorizedState() : AuthUnauthorizedState();
      emit(newState);
    });

    /// user logout
    on<AuthLogoutEvent>((event, emit) async {
      try {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool('is_login_in', false);
        _authService.logOut();
      } catch (e) {
        emit(AuthFailureState(e.toString()));
      }
    });

    /// user login
    on<AuthLoginEvent>((event, emit) async {
      try {
        UserModel? userModel = await _authService.signinWithEmailAndPass(
          event.email.trim(),
          event.password.trim(),
        );

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('is_login_in', true);

        emit(AuthAuthorizedState());
      } catch (e) {
        emit(AuthFailureState(e.toString()));
      }
    });

    /// sign up new user
    on<AuthSignUpEvent>((event, emit) async {
      try {
        UserModel? userModel = await _authService.registerWithEmailAndPass(
          event.email.trim(),
          event.password.trim(),
        );

        emit(AuthAuthorizedState());
      } catch (e) {
        emit(AuthFailureState(e.toString()));
      }
    });
  }
}
