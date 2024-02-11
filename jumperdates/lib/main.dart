import 'dart:convert';
import 'dart:io';
// commented this out because it auto-generated and crashed it so well done dart
// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:jumperdates/services/jumper.dart';
import 'package:jumperdates/views/home.dart';

Future main() async {
  runApp(const JumperDates());

  Socket? s = await JumperService.createSocket();
  s?.write(ascii.encode("BOOT"));

  s?.listen((data) {  
    JumperService.formatRequests(String.fromCharCodes(data).trim());
  });
  
  s?.close();
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