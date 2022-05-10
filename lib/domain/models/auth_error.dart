import 'package:firebase_auth/firebase_auth.dart';

Map<String, AuthError> authErrorMapping = {
  'user-not-found': AuthErrorUserNotFound(),
  'week-password': AuthErrorWeekPassword(),
  'invalid-email': AuthErrorInvalidEmail(),
  'operation-not-allowed': AuthErrorOperationNotAllowed(),
  'email-already-in-use': AuthErrorEmailAlreadyUse(),
  'requires-recent-login': AuthErrorRequiresRecentLogin(),
  'no-current-user': AuthErrorNoCurrentUser(),
};

abstract class AuthError {
  final String dialogTitle;
  final String dialogText;

  const AuthError({
    required this.dialogTitle,
    required this.dialogText,
  });

  factory AuthError.from(FirebaseAuthException exception) =>
      authErrorMapping[exception.code.toLowerCase().trim()] ??
      AuthErrorUnknown(exception);
}

class AuthErrorUnknown extends AuthError {
  final FirebaseAuthException innerException;
  AuthErrorUnknown(this.innerException)
      : super(
          dialogTitle: 'authentication error',
          dialogText: 'unknown authentication error',
        );
}

class AuthErrorNoCurrentUser extends AuthError {
  AuthErrorNoCurrentUser()
      : super(
          dialogTitle: 'no current user ',
          dialogText: 'no current  user error',
        );
}

class AuthErrorRequiresRecentLogin extends AuthError {
  AuthErrorRequiresRecentLogin()
      : super(
          dialogTitle: 'requires recent login user ',
          dialogText: 'you need to long and log back in again in order',
        );
}

class AuthErrorOperationNotAllowed extends AuthError {
  AuthErrorOperationNotAllowed()
      : super(
          dialogTitle: 'Opertion not allowed ',
          dialogText: 'you cannot register using this method at this moment',
        );
}

class AuthErrorUserNotFound extends AuthError {
  AuthErrorUserNotFound()
      : super(
          dialogTitle: 'User not found',
          dialogText: 'the given User was not found',
        );
}

class AuthErrorWeekPassword extends AuthError {
  AuthErrorWeekPassword()
      : super(
          dialogTitle: 'Weak password',
          dialogText: 'Please choose a stronger password consisting',
        );
}

class AuthErrorInvalidEmail extends AuthError {
  AuthErrorInvalidEmail()
      : super(
          dialogTitle: 'invalid email',
          dialogText: 'Please double check your email',
        );
}

class AuthErrorEmailAlreadyUse extends AuthError {
  AuthErrorEmailAlreadyUse()
      : super(
          dialogTitle: 'email already in yuse ',
          dialogText: 'Please choose another email',
        );
}
