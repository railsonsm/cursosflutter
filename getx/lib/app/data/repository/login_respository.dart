import 'package:firebase_auth/firebase_auth.dart';
import 'package:getx/app/data/providers/login_provider.dart';

class LoginRepository {
  final LoginApiClient loginClient = LoginApiClient();

  Future<User> createUserWithEmailAndPassword(String email, String password, String name) {
    return loginClient.createUserWithEmailAndPassword(email, password, name);
  }

  Future<User> signInUserWithEmailAndPassword(String email, String password) {
    return loginClient.signInUserWithEmailAndPassword(email, password);
  }
}
