import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Connexion avec email & mot de passe
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error: $e");
      return null; // ✅ Always return a value
    }
  }

  // Inscription avec email & mot de passe (Complété)
  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print("Error: $e");
      return null; // ✅ Always return a value
    }
  }

  // ✅ Déconnexion (Fixe l'erreur)
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("User signed out successfully");
    } catch (e) {
      print("Sign-out error: $e");
    }
  }
}
