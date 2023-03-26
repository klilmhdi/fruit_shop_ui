import 'package:flutter/material.dart';
import 'package:fruit_shop_ui/screens/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Shop UI',
      theme: ThemeData(useMaterial3: true),
      home: const IntroPage(),
    );
  }
}