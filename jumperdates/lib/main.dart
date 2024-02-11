import 'dart:convert';
import 'dart:io';
// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:jumperdates/services/jumper.dart';
import 'package:jumperdates/views/home.dart';

Future main() async {
  runApp(const JumperDates());

  Socket? s = await JumperService.createSocket();

  s?.write(ascii.encode("BOOT"));
  s?.listen((data) {
    print(String.fromCharCodes(data).trim());
  });
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