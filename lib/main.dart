import 'package:flutter/material.dart';
import 'package:lab1/statefull.dart';
//import 'package:lab1/stateless.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidget(),
    );
  }
}
