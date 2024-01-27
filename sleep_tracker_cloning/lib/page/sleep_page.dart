import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:sleep_tracker_cloning/page/sleep_record.dart';

class sleepPage extends StatefulWidget {
  const sleepPage({super.key});

  @override
  State<sleepPage> createState() => _sleepPageState();
}

class _sleepPageState extends State<sleepPage> {
  TimeOfDay sleepTime = TimeOfDay.now();
  TimeOfDay wakeTime =
      TimeOfDay.fromDateTime(DateTime.now().add(Duration(hours: 8)));

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black, Color.fromARGB(219, 15, 7, 83)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const AnalogClock(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: sleepTime,
                        );
                        if (timeOfDay != null) {
                          setState(() {
                            sleepTime = timeOfDay;
                            wakeTime = sleepTime.replacing(
                                hour: sleepTime.hour + 8,
                                minute: sleepTime.minute);
                          });
                        }
                      },
                      child: Text(
                        '${sleepTime.hour}:${sleepTime.minute}', //초기 시간은 현재시간
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Text(
                      '취침시간',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: wakeTime,
                        );
                        if (timeOfDay != null) {
                          setState(() {
                            wakeTime = timeOfDay;
                          });
                        }
                      },
                      child: Text(
                        '${wakeTime.hour}:${wakeTime.minute}', //초기 시간은 현재시간
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Text(
                      '기상시간',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => sleepRecord()));
              },
              child: Text(
                '지금 취침',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
