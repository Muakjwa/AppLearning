import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

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
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: Container(),
    );
  }
}
