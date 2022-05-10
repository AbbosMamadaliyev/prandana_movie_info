import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/dataproviders/auth_service/auth_service.dart';
import '../../domain/models/auth_error.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authService = AuthService();

  AuthBloc() : super(AuthLoggedOutState(isLoading: false)) {
    /* /// check auth status
    on<AuthCheckStatusEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLogIn = prefs.getBool('is_login_in') ?? false;
    });*/

    on<AuthInitialEvent>((event, emit) async {
      final user = _authService.currentUser;
      if (user == null) {
        emit(AuthLoggedOutState(isLoading: false));
      } else {
        emit(AuthLoggedOutState(isLoading: false));
      }
    });

    /// user logout
    on<AuthLogoutEvent>((event, emit) async {
      emit(AuthLoggedOutState(isLoading: true));

      try {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool('is_login_in', false);

        await _authService.logOut();

        emit(AuthLoggedOutState(isLoading: false));
      } catch (e) {}
    });

    /// user login
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthIsInRegistrationViewState(isLoading: true));

      try {
        final user = await _authService.signinWithEmailAndPass(
          event.email.trim(),
          event.password.trim(),
        );

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('is_login_in', true);

        emit(AuthLoggedInState(isLoading: false, user: user));
      } on FirebaseAuthException catch (e) {
        emit(
            AuthLoggedOutState(isLoading: false, authError: AuthError.from(e)));
      }
    });

    /// sign up new user
    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthIsInRegistrationViewState(isLoading: true));

      try {
        final user = await _authService.registerWithEmailAndPass(
          event.email.trim(),
          event.password.trim(),
        );

        emit(AuthLoggedInState(isLoading: false, user: user));
      } on FirebaseAuthException catch (e) {
        emit(AuthIsInRegistrationViewState(
          isLoading: false,
          authError: AuthError.from(e),
        ));
      }
    });
  }
}
