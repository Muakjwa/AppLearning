import 'dart:html';
import 'package:flutter/material.dart';

class sleepPage extends StatefulWidget {
  const sleepPage({super.key});

  @override
  State<sleepPage> createState() => _sleepPageState();
}

class _sleepPageState extends State<sleepPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '수면 트래커',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Leap Fitness',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
      body: Container(),
    );
  }
}
