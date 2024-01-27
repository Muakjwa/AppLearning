import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sleep_tracker_cloning/page/explore_detail.dart';

class explorePage extends StatefulWidget {
  const explorePage({super.key});

  @override
  State<explorePage> createState() => _explorePageState();
}

class _explorePageState extends State<explorePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late AutoScrollController _autoScrollController;

  static const List<Tab> myTabs = <Tab>[
    Tab(text: '소리'),
    Tab(text: '음악'),
    Tab(text: '호흡'),
    Tab(text: '스트레칭'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: TabBar(
      //     controller: _tabController,
      //     tabs: myTabs,
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black, Color.fromARGB(219, 15, 7, 83)],
          ),
        ),
        alignment: Alignment.center,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 12,
                left: width * 0.04,
                bottom: 12,
              ),
              child: Text(
                textAlign: TextAlign.left,
                '수면을 위한 소리',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => exploreDetail()));
                },
                child: Stack(
                  children: [
                    Container(
                      width: width * 0.92, // 원하는 너비
                      height: height * 0.2, // 원하는 높이
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('images/night.JPG'), // 이미지 경로
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.025,
                          top: height * 0.15,
                        ),
                        child: Text(
                          '밤하늘 별똥별', // 표시할 텍스트
                          style: TextStyle(
                            color: Colors.white, // 텍스트 색상
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => exploreDetail()));
                },
                child: Stack(
                  children: [
                    Container(
                      width: width * 0.92, // 원하는 너비
                      height: height * 0.2, // 원하는 높이
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('images/forest.jpg'), // 이미지 경로
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.025,
                          top: height * 0.15,
                        ),
                        child: Text(
                          '숲 속 보슬비', // 표시할 텍스트
                          style: TextStyle(
                            color: Colors.white, // 텍스트 색상
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => exploreDetail()));
                },
                child: Stack(
                  children: [
                    Container(
                      width: width * 0.92, // 원하는 너비
                      height: height * 0.2, // 원하는 높이
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('images/river.jpg'), // 이미지 경로
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.025,
                          top: height * 0.15,
                        ),
                        child: Text(
                          '개울가 귀뚜라미 소리', // 표시할 텍스트
                          style: TextStyle(
                            color: Colors.white, // 텍스트 색상
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => exploreDetail()));
                },
                child: Stack(
                  children: [
                    Container(
                      width: width * 0.92, // 원하는 너비
                      height: height * 0.2, // 원하는 높이
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('images/waterfall.jpg'), // 이미지 경로
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.025,
                          top: height * 0.15,
                        ),
                        child: Text(
                          '폭포 소리', // 표시할 텍스트
                          style: TextStyle(
                            color: Colors.white, // 텍스트 색상
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
