import 'package:flutter/material.dart';
import 'package:footba11x/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 34, 34, 50)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
