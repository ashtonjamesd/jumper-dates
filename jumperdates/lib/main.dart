import 'package:flutter/material.dart';
import 'package:jumperdates/views/home.dart';
import 'package:jumperdates/views/login.dart';


void main() {
  runApp(const JumperDates());
}

class JumperDates extends StatelessWidget {
  const JumperDates({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}