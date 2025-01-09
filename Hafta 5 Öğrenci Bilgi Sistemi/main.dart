import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MSB OBS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
