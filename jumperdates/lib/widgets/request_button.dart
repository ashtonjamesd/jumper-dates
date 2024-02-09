import 'package:flutter/material.dart';
import 'package:jumperdates/data.dart';
import 'package:jumperdates/models/request.dart';
import 'package:jumperdates/services/jumper.dart';

class RequestButton extends StatelessWidget {
  const RequestButton({super.key, required this.date, required this.description});

  final DateTime date;
  final String description;

  @override
  Widget build(BuildContext context) {
    JumperService jumper = JumperService();

    return GestureDetector(
      onTap: () {

        JumperRequest req = JumperRequest(
          isRequest: tempIsRequestVal == "CL" ? true : false, 
          id: jumper.generateRequestID(),
          date: date, 
          userID: tempPersonVal,
          description: description,
        );

        jumper.sendRequest(req);
      },
      child: Container(
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 62, 62, 62),
          borderRadius: BorderRadius.circular(4)
        ),
        child: const Center(
          child: Text(
            "Request",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}