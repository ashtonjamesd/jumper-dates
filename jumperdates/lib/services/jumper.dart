import 'package:jumperdates/models/request.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'dart:io';
import 'dart:convert';

class JumperService {

  static const String IP_ENDPOINT_ADDRESS = '192.168.1.250';
  static const int PORT = 8001;

  static bool wasSuccess = false;

  static bool getSuccess() => wasSuccess;

  static Future<Socket> createConnection() async {
    return await Socket.connect(IP_ENDPOINT_ADDRESS, PORT);
  }

  static Future<Socket?> createSocket() async {
    try {
      Socket socket = await createConnection();
      return socket;

    } catch (exception) {
      print("Jumper Request Error: $exception");
      return null;
    }
  }

  static Future<void> sendRequest(JumperRequest request) async {
    try {
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

      Socket? socket = await createSocket();

      socket?.write(jumperRequest);
      // listenForJumperServer();

      socket?.listen((data) {
      print("Server: ${String.fromCharCodes(data).trim()}");
      if (String.fromCharCodes(data).trim() == "T") {
        wasSuccess = true;
      } else {
        wasSuccess = false;
      }
      });

      socket?.close();

    } catch (exception) {
      print("Error: $exception");
    }
    
  }
}


