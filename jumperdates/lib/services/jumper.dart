import 'package:jumperdates/models/request.dart';

class JumperService {

  bool request(Request request) {
    print("requesting for date: ${request.date}");
    print("requesting for person: ${request.userID}");
    print("IsRequest: ${request.isRequest}");

    return true;
  }
}