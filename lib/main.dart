import 'package:adwatcher/view/create_character.dart';
import 'package:adwatcher/view/home/home_screen.dart';
import 'package:flutter/material.dart';

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
        splashColor: Colors.green,
        textTheme: const TextTheme(
          titleLarge: TextStyle(),
          displayLarge: TextStyle(),
          bodyMedium: TextStyle(),
        ).apply(bodyColor: const Color(0xFF000000)),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith((state) => const Color(0xFFDBD7D2)),
          ),
        ),
      ),
      // home: HomeScreen(),
      home: CreateCharacterWidget()
    );
  }
}

class AppLoadingScreen extends StatelessWidget {
  const AppLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 100),
            Text("AdWatcher"),
          ],
        ),
      ),
    );
  }
}