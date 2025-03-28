import 'package:jumperdates/models/request.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:core';

import '../data.dart';

class JumperService {

 // DO NOT SHARE THIS IP ADDRESS PLEASE
 // PUBLIC: 146.198.141.115
 // PRIVATE: 192.168.1.250
  static const String IP_ENDPOINT_ADDRESS = '146.198.141.115';
  static const int PORT = 8001;

  static bool wasSuccess = false;

  static bool getSuccess() => wasSuccess;

  static Future<Socket?> createConnection() async {
    try {
      return await Socket.connect(IP_ENDPOINT_ADDRESS, PORT);
    
    } catch (exception) {
      print("Error creating socket connection: $exception");
      return null;
    }
  }

  static Future<Socket?> createSocket() async {
    try {
      return await createConnection();

    } catch (exception) {
      print("Error creating socket: $exception");
      return null;
    }
  }

  static Future<void> sendRequest(JumperRequest request) async {
    try {
      // get all necessary data and map it
      String date = request.date;
      String dateOfRequest = request.dateOfRequest;
      String userID = request.userID;
      bool isRequest = request.isRequest;
      String id = request.id;
      String description = request.description;

      Map<String, dynamic> jsonData = {
        'RequestDate': date,
        'DateOfRequest': dateOfRequest,
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
      print("Error sending request: $exception");
    }
  }

  static void formatRequests(String requestData) async {
    var splitData = requestData.split('#D8JSPLIT#');

    print(requestData);

    int counter = 0;

    try {
      for (var data in splitData) {
        print(counter);
        var json = jsonDecode(data);
        
        JumperRequest request = JumperRequest(
          isRequest: json['IsRequest'], 
          id: json['UUID'], 
          date: json['RequestDate'],
          dateOfRequest: json['DateOfRequest'],
          userID: json['UserUUID'] ,
          description: json['Description'],
        );

        activeRequests.add(request);
        counter++;    
      }

    } catch (exception) {
      print(exception);
    }
  }
}
