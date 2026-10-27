import 'package:flutter/material.dart';

import '../services/speech_service.dart';

/// 첫 화면. 시각장애인 사용자를 위해 화면 전체를 하나의 큰 버튼으로 둔다.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SpeechService _speech = SpeechService();

  @override
  void initState() {
    super.initState();
    _speech.speak('패션 에이전트입니다. 화면 아무 곳이나 누르면 오늘의 코디 추천을 시작합니다.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Semantics(
        button: true,
        label: '오늘의 코디 추천 시작',
        child: InkWell(
          onTap: () => _speech.speak('추천 기능은 준비 중입니다.'),
          child: const Center(
            child: Text(
              '화면을 눌러\n코디 추천 시작',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
