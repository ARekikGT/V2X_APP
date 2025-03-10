import 'package:firebase_core/firebase_core.dart';

class FirebaseOptionsConfig {
  static Future<void> initialize() async {
    await Firebase.initializeApp();
  }
}
