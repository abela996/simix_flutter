import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const SimixApp());
}

class SimixApp extends StatelessWidget {
  const SimixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simix Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginScreen(),
    );
  }
}
