import 'package:flutter/material.dart';
import 'package:jumperdates/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  runApp(const JumperDates());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class JumperDates extends StatelessWidget {
  const JumperDates({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}