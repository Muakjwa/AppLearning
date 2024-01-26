import 'dart:async';

import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      body: PopScope(
        canPop: false,
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/loading.jpg'),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.65,
                left: width * 0.1,
                right: 0,
                child: Text(
                  '수면 디퓨저',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: height * 0.75,
                left: width * 0.1,
                right: 0,
                child: Text(
                  '당신의 수면을 도와주는 향',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }
}
