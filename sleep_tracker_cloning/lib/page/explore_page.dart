import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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
      appBar: AppBar(
        flexibleSpace: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Text(
                  '수면을 위한 소리',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: ClipRRect(
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'images/night.JPG',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: ClipRRect(
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'images/night.JPG',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: ClipRRect(
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'images/night.JPG',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: ClipRRect(
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'images/night.JPG',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
