import 'package:flutter/material.dart';
import 'package:jumperdates/views/home.dart';

Future main() async {
  runApp(const JumperDates());

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