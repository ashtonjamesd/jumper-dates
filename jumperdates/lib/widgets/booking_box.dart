import 'package:flutter/material.dart';

class BookingBox extends StatefulWidget {
  const BookingBox({super.key});

  @override
  State<BookingBox> createState() => _BookingBoxState();
}

class _BookingBoxState extends State<BookingBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: SizedBox(
        width: 720,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  "ACTIVE REQUESTS",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500
                  ),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Container(
                width: 520,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 236, 236),
                  borderRadius: BorderRadiusDirectional.circular(8),
                  border: Border.all(color: const Color.fromARGB(255, 225, 225, 225), width: 2)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}