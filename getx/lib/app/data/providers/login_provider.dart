import 'package:firebase_auth/firebase_auth.dart';
import 'package:getx/app/data/model/user_model.dart';

class LoginApiClient {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<UserApp> get onAuthStateChanged => _firebaseAuth.authStateChanges().map((User currentUser) => UserApp(
      id: currentUser.uid, email: currentUser.email, name: currentUser.displayName, urlImage: currentUser.photoURL));

  Future<User> createUserWithEmailAndPassword(String email, String password, String name) async {
    try {
      final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      await currentUser.user.updateProfile(displayName: name);
      await currentUser.user.reload();

      return currentUser.user;
    } catch (e) {
      print(e);
    }
  }

  Future<User> signInUserWithEmailAndPassword(String email, String password) async {
    try {
      final currentUser = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return currentUser.user;
    } catch (e) {
      print(e);
    }
  }

  signOut() {
    return _firebaseAuth.signOut();
  }
}
