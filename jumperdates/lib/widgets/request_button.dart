import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RequestButton extends StatelessWidget {
  const RequestButton({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(date);
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