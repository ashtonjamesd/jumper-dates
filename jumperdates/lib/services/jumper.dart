import 'package:jumperdates/models/request.dart';

class JumperService {

  bool request(Request request) {
    print("date: ${request.date}");
    print("person: ${request.userID}");
    print("isRequest: ${request.isRequest}");

    return true;
  }
}