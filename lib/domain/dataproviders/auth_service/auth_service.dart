import 'package:firebase_auth/firebase_auth.dart';
import 'package:prandana_movie_info/domain/models/user.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User> signinWithEmailAndPass(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user!;
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }

  Future<User> registerWithEmailAndPass(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user!;
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }

  Future logOut() async {
    return await _auth.signOut();
  }

  Stream<UserModel?> get currentUser {
    return _auth
        .authStateChanges()
        .map((user) => user != null ? UserModel.fromFirebase(user) : null);
  }
}
