import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class statistic extends StatefulWidget {
  const statistic({super.key});

  @override
  State<statistic> createState() => _statisticState();
}

class CircleProgressPainter extends CustomPainter {
  final double percentage;
  final double lineWidth;

  CircleProgressPainter({required this.percentage, this.lineWidth = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2);

    // 원의 배경을 그립니다.
    final backgroundPaint = Paint()
      ..strokeWidth = lineWidth
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backgroundPaint);

    // 퍼센트에 따른 원 테두리를 그립니다.
    final progressPaint = Paint()
      ..strokeWidth = lineWidth
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double sweepAngle = 2 * math.pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2, // 시작 각도
      sweepAngle, // 스윕 각도
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircleProgressPainter oldDelegate) {
    return percentage != oldDelegate.percentage;
  }
}

class _statisticState extends State<statistic> {
  final double percentage = 67;

  // 사용자 데이터 불러오기
  void getUserDataFromFirestore() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid; // 로그인한 사용자의 ID
      String key = '일'; // 가져오고자 하는 key

      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          // print('사용자 데이터: ${documentSnapshot.data()}');
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;
          var value = data[key]; // 특정 key에 해당하는 value
          print('key의 value: $value');
        } else {
          print('사용자 데이터가 없습니다.');
        }
      });
    } else {
      print('사용자가 로그인하지 않았습니다.');
    }
  }

  // Week day sleep time 가져오기
  Future<double> getUserSleepTimeFromFirestore(String key) async {
    User? user = FirebaseAuth.instance.currentUser;
    double value = 0;
    if (user != null) {
      String userId = user.uid; // 로그인한 사용자의 ID

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;
          value = data[key]; // 특정 key에 해당하는 value
          print(value);
          return value;
        }
      });
    }
    return value;
  }

  void getDataFromFirestore() async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    try {
      QuerySnapshot snapshot = await db.collection('product').get();
      snapshot.docs.forEach((doc) {
        print(doc.data());
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    List<String> days = ['일', '월', '화', '수', '목', '금', '토'];

    Future<Widget> weekGraph(String day) async {
      double percentage = await getUserSleepTimeFromFirestore(day);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 5,
          ),
          CustomPaint(
            painter: CircleProgressPainter(percentage: percentage),
            child: Container(
              width: 45,
              height: 45,
              child: Center(
                child: Text(
                  '${percentage.toInt()}%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            day,
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      );
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black, Color.fromARGB(219, 15, 7, 83)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          // database test padding
          Padding(
            padding: EdgeInsets.only(top: width * 0.05, left: width * 0.065),
            child: ElevatedButton(
              onPressed: () {
                getUserDataFromFirestore();
                getDataFromFirestore();
              },
              child: Text(
                'get data',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: width * 0.05, left: width * 0.065),
            child: Text(
              '화요일',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.065),
            child: Text(
              '2023.02.29',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: width * 0.87,
              height: height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 27, 26, 35),
              ),
              child: FutureBuilder<List<Widget>>(
                future: Future.wait(
                    days.map((day) => weekGraph(day))), // 여러 Future 동시 처리
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // 로딩 중
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: snapshot.data!, // Row에 위젯 리스트 배치
                    );
                  } else {
                    return Text('No data');
                  }
                },
              ),

              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     weekGraph("일"),
              //     weekGraph('월'),
              //     weekGraph('화'),
              //     weekGraph('수'),
              //     weekGraph('목'),
              //     weekGraph('금'),
              //     weekGraph('토'),
              //   ],
              // ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * 0.4,
                height: height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 27, 26, 35),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: width * 0.02, left: width * 0.04),
                        child: Text(
                          '평균',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: width * 0.005, left: width * 0.04),
                        child: Text(
                          '수면 시간',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: width * 0.05, left: width * 0.04),
                            child: Text(
                              '6.2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: width * 0.07, left: width * 0.02),
                            child: Text(
                              '하루 평균',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              SizedBox(
                width: width * 0.07,
              ),
              Container(
                width: width * 0.4,
                height: height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 27, 26, 35),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: width * 0.02, left: width * 0.04),
                      child: Text(
                        '수면질',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: CustomPaint(
                        painter: CircleProgressPainter(percentage: percentage),
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: Text(
                              '${percentage.toInt()}%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: width * 0.87,
              height: height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 27, 26, 35),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: width * 0.02, left: width * 0.04),
                      child: Text(
                        '당일 수면 정보',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: width * 0.05,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '계정 설정',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.3,
                                  ),
                                  Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '계정 설정',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: width * 0.05,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '계정 설정',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.3,
                                  ),
                                  Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '계정 설정',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: width * 0.87,
              height: height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 27, 26, 35),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: width * 0.02, left: width * 0.04),
                    child: Text(
                      '주간 수면',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
