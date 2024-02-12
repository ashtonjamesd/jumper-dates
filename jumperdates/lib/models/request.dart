import 'dart:core';

class JumperRequest {
  bool isRequest;
  String id;
  String date;
  String dateOfRequest;
  String userID;
  String description;

  JumperRequest({
    required this.isRequest, 
    required this.id, 
    required this.date, 
    required this.dateOfRequest,
    required this.userID,
    required this.description,
  });
}