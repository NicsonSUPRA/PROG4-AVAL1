import 'package:flutter/material.dart';
import './pages/forca_page.dart';

void main() {
  runApp(const JokenpoApp());
}

class JokenpoApp extends StatelessWidget {
  const JokenpoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JokenpoApp",
      theme: ThemeData(
        useMaterial3: true
      ),
      home: ForcaPage(),
    );
  }
}