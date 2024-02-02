class Request {
  bool isRequest;
  String description;
  DateTime date;
  String userID;

  Request({
    required this.isRequest, 
    required this.description, 
    required this.date, 
    required this.userID
  });
}