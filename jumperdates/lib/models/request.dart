class JumperRequest {
  bool isRequest;
  String id;
  String date;
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