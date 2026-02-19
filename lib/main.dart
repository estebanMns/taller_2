import 'package:flutter/material.dart';
import 'screens/main_navigation.dart';

void main() => runApp(const ProStoreApp());

class ProStoreApp extends StatelessWidget {
  const ProStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ProStore E-commerce',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A237E),
          primary: const Color(0xFF1A237E),
          secondary: const Color(0xFF00B0FF),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),
      ),
      home: const MainNavigation(),
    );
  }
}