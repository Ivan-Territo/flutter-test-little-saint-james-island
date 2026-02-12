import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Importa la home aggiornata

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Surf Shop',
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