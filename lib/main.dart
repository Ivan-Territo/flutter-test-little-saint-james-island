import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override // tema generale
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A Tavoletta e-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF5F8D88),
        primaryColor: const Color(0xFFD9FF00),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}