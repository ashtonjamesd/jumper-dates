import 'package:jumperdates/models/request.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'dart:io';
import 'dart:convert';

class JumperService {

  final String ip = '172.25.7.86';
  final int port = 8001;

  static bool success = false;

  static bool getSuccess() => success;

  Future<bool> sendRequest(JumperRequest request) async {

    String date = request.date.toString().substring(0, 10);
    String userID = request.userID;
    bool isRequest = request.isRequest;
    Guid id = request.id;
    String description = request.description;

    Map<String, dynamic> jsonData = {
      'RequestDate': date,
      'UUID': id.toString(),
      'UserUUID': userID,
      'IsRequest': isRequest,
      'Description': description,
    };

    String jumperRequest = jsonEncode(jsonData);

    try {
      final socket = await Socket.connect(ip, port);

      socket.write(jumperRequest);
      
      listenForServer(socket);
      print("listening");

      return true;

    } catch (exception) {
      print("Jumper Request Error: $exception");
      return false;
    }
  }

  void listenForServer(Socket socket) {
    print('Connected: ${socket.remoteAddress.address}:${socket.remotePort}');

    socket.listen((data) {
      print("Server: ${String.fromCharCodes(data).trim()}");
      if (String.fromCharCodes(data).trim() == "T") {
        success = true;
      } else {
        success = false;
      }
    }, onDone: () {
      socket.destroy();
    });
  }
}


