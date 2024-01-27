import 'package:flutter/material.dart';

class sleepRecord extends StatefulWidget {
  const sleepRecord({super.key});

  @override
  State<sleepRecord> createState() => _sleepRecordState();
}

class _sleepRecordState extends State<sleepRecord> {
  TimeOfDay nowTime = TimeOfDay.now();

  String getPeriod(TimeOfDay time) {
    return time.hour < 12 ? '오전' : '오후';
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.1),
            child: Text(
              '현재 시각',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.05),
            child: Center(
              child: Text(
                '${nowTime.hour}:${nowTime.minute} ${getPeriod(nowTime)}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 55,
                  letterSpacing: 1,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
