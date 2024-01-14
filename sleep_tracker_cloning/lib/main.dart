import 'package:flutter/material.dart';
import 'package:sleep_tracker_cloning/page/home.dart';
import 'package:sleep_tracker_cloning/page/sleep_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
    );
  }
}
