import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:jumperdates/data.dart';
import 'package:jumperdates/models/request.dart';
import 'package:jumperdates/services/jumper.dart';

class RequestButton extends StatefulWidget {
  const RequestButton({super.key, required this.date, required this.description, required this.onRequestSent});

  final DateTime date;
  final String description;
  final VoidCallback onRequestSent;

  @override
  State<RequestButton> createState() => _RequestButtonState();
}

class _RequestButtonState extends State<RequestButton> {
  String requestButtonText = "Request";
  Color requestButtonColour = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

        JumperRequest req = JumperRequest(
          isRequest: tempIsRequestVal == "CL" ? true : false, 
          id: Guid.newGuid.toString(),
          date: widget.date.toString(), 
          userID: tempPersonVal,
          description: widget.description,
        );

        try {
        JumperService.sendRequest(req);
        await Future.delayed(const Duration(seconds: 1));
        widget.onRequestSent();

        setState(() {
          requestButtonText = "Request sent";
          requestButtonColour = const Color.fromARGB(255, 131, 120, 238);
        });
        await Future.delayed(const Duration(seconds: 1));
         setState(() {
          requestButtonText = "Request";
          requestButtonColour = Colors.white;
         });
        } catch (exception) {
          print("Error Sending Jumper Request: $exception");
        }
      },
      child: Container(
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 62, 62, 62),
          borderRadius: BorderRadius.circular(4)
        ),
        child: Center(
          child: Text(
            requestButtonText,
            style: TextStyle(
              color: requestButtonColour,
              fontWeight: requestButtonText == "Request" ? FontWeight.normal : FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}