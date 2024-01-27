import 'package:flutter/material.dart';

class alarm extends StatefulWidget {
  const alarm({super.key});

  @override
  State<alarm> createState() => _alarmState();
}

class _alarmState extends State<alarm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Setting Page'),
      ),
    );
  }
}
