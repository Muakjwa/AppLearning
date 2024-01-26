import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sleep_tracker/page/home.dart';
import 'package:sleep_tracker/page/loading_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Disable persistence on web platforms. Must be called on initialization:
  final auth = FirebaseAuth.instanceFor(
      app: Firebase.app(), persistence: Persistence.NONE);
  // To change it after initialization, use `setPersistence()`:
  await auth.setPersistence(Persistence.LOCAL);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(),
        '/home': (context) => Home(),
      },
    );
  }
}
