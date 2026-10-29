import 'package:flutter/material.dart';

import 'screens/session_screen.dart';
import 'services/capture_service.dart';
import 'services/fake_vision_service.dart';
import 'services/speech_service.dart';
import 'services/vision_service.dart';
import 'services/wardrobe_store.dart';
import 'services/weather_service.dart';
import 'session/session_controller.dart';

/// 프록시 주소. 비어 있으면 가짜 비전 AI로 돈다.
/// 예: `flutter run --dart-define=VISION_URL=https://example.workers.dev`
const _visionUrl = String.fromEnvironment('VISION_URL');

/// 카메라 없는 시뮬레이터에서 돌릴 때: `--dart-define=FAKE_CAMERA=true`
const _fakeCamera = bool.fromEnvironment('FAKE_CAMERA');

void main() {
  runApp(FashionAgentApp(
    controller: SessionController(
      speech: SpeechService(),
      weatherService: WeatherService(),
      capture: _fakeCamera ? FakeCaptureService() : CameraCaptureService(),
      vision: _visionUrl.isEmpty
          ? FakeVisionService()
          : HttpVisionService(Uri.parse(_visionUrl)),
      wardrobe: LocalWardrobeStore(),
    ),
  ));
}

class FashionAgentApp extends StatelessWidget {
  const FashionAgentApp({super.key, required this.controller});

  final SessionController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '패션 에이전트',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: SessionScreen(controller: controller),
    );
  }
}
