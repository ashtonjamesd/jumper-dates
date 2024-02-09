import 'package:flutter_guid/flutter_guid.dart';

class JumperRequest {
  bool isRequest;
  Guid id;
  DateTime date;
  String userID;
  String description;

  JumperRequest({
    required this.isRequest, 
    required this.id, 
    required this.date, 
    required this.userID,
    required this.description,
  });
}