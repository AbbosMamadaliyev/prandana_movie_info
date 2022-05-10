part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final bool isLoading;
  final AuthError? authError;

  const AuthState({
    required this.isLoading,
    this.authError,
  });

  @override
  List<Object?> get props => [isLoading, authError];
}

/*
class AuthUnauthorizedState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthProgressState extends AuthState {
  @override
  List<Object> get props => [];
}
*/

class AuthLoggedInState extends AuthState {
  final User user;
  AuthLoggedInState({
    required bool isLoading,
    required this.user,
    AuthError? authError,
  }) : super(isLoading: isLoading, authError: authError);

  @override
  List<Object> get props => [user];
}

class AuthIsInRegistrationViewState extends AuthState {
  AuthIsInRegistrationViewState({
    required bool isLoading,
    AuthError? authError,
  }) : super(isLoading: isLoading, authError: authError);

  @override
  List<Object> get props => [];
}

class AuthLoggedOutState extends AuthState {
  AuthLoggedOutState({
    required bool isLoading,
    AuthError? authError,
  }) : super(isLoading: isLoading, authError: authError);

  @override
  List<Object> get props => [];
}

/*
class AuthFailureState extends AuthState {
  final String message;

  const AuthFailureState(this.message);

  @override
  List<Object> get props => [];
}
*/

enum AuthStateService { authorized, notAuthorized, inProgress }

extension GetUser on AuthState {
  User? get user {
    final cls = this;
    if (this is AuthLoggedInState) {
      return cls.user;
    } else {
      return null;
    }
  }
}
