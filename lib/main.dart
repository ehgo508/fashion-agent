import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const FashionAgentApp());
}

class FashionAgentApp extends StatelessWidget {
  const FashionAgentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '패션 에이전트',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
