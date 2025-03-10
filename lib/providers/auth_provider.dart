import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  // ✅ Make sure this class exists
  final AuthService _authService = AuthService();
  UserModel? _user;

  UserModel? get user => _user;

  bool get isAuthenticated => _user != null;

  Future<bool> login(String email, String password) async {
    var firebaseUser = await _authService.signInWithEmail(email, password);
    if (firebaseUser != null) {
      _user = UserModel(
        uid: firebaseUser.uid,
        name: firebaseUser.displayName ?? '',
        email: firebaseUser.email ?? '',
      );
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> register(String email, String password) async {
    var firebaseUser = await _authService.signUpWithEmail(email, password);
    if (firebaseUser != null) {
      _user = UserModel(
        uid: firebaseUser.uid,
        name: '',
        email: firebaseUser.email ?? '',
      );
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }
}
