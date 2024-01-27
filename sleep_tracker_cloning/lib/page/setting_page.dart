import 'package:flutter/material.dart';
import 'package:sleep_tracker_cloning/page/setting/alarm.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    List<Widget> items = [
      ListTile(
        leading: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        title: Text(
          '계정 설정',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => alarm()));
        },
      ),
      ListTile(
        leading: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
        title: Text(
          '알림 설정',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => alarm()));
        },
      ),
      ListTile(
        leading: Icon(
          Icons.lock,
          color: Colors.white,
        ),
        title: Text(
          '보안',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => alarm()));
        },
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black, Color.fromARGB(219, 15, 7, 83)],
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: height * 0.05),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.02,
              right: width * 0.02,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 27, 26, 35),
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(width * 0.02),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'), // 프로필 이미지 URL
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    '닉네임', // 사용자 닉네임
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 설정 옵션 리스트
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 27, 26, 35),
                ),
                child: ListView.separated(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return items[index]; // 각 ListTile 위젯을 반환
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
