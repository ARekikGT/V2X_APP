import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  final FlutterTts _tts = FlutterTts();

  Future<void> speak(String message) async {
    await _tts.setLanguage("en-US");
    await _tts.setPitch(1.0);
    await _tts.speak(message);
  }
}
