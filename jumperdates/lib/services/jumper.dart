import 'package:jumperdates/models/request.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'dart:io';
import 'dart:convert';

class JumperService {

 // DO NOT SHARE THIS IP ADDRESS PLEASE
  static const String IP_ENDPOINT_ADDRESS = '146.198.141.115';
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
      // get all necessary data and map it
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

      // encode json string into a byte array and send over to backend
      String jumperRequest = jsonEncode(jsonData);     
      Socket? socket = await createSocket();

      socket?.write(jumperRequest);

      // listen for the server validation to see if request was a succcess
      socket?.listen((data) {
      String dataString = String.fromCharCodes(data).trim();
      print("Server: $dataString");
      if (dataString == "T") {
        wasSuccess = true;
      } else {
        wasSuccess = false;
      }
      });

      // end socket to prevent poly listening error
      socket?.close();

    // whoops
    } catch (exception) {
      print("Error: $exception");
    }
    
  }
}


