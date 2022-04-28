part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthLogoutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthCheckStatusEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];

  const AuthLoginEvent({
    required this.email,
    required this.password,
  });
}

class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String name;
  final String password;

  @override
  List<Object?> get props => [email, name, password];

  const AuthSignUpEvent({
    required this.email,
    required this.name,
    required this.password,
  });
}
