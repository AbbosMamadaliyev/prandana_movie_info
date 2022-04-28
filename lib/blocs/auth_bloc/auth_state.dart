part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthUnauthorizedState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthProgressState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthAuthorizedState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthFailureState extends AuthState {
  final String message;

  const AuthFailureState(this.message);

  @override
  List<Object> get props => [];
}

enum AuthStateService { authorized, notAuthorized, inProgress }
