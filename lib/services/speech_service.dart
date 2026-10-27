import 'package:flutter_tts/flutter_tts.dart';

/// 앱의 모든 음성 안내를 담당한다.
class SpeechService {
  final FlutterTts _tts = FlutterTts();

  Future<void> speak(String text) async {
    await _tts.setLanguage('ko-KR');
    await _tts.stop();
    await _tts.speak(text);
  }
}
