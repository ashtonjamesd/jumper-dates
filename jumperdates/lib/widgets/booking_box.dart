import 'package:flutter/material.dart';
import '../data.dart';

class JumperRequest {
  final String title;
  final String description;

  JumperRequest({required this.title, required this.description});
}

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
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8, left: 8),
              child: Text(
                "ACTIVE REQUESTS",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: activeRequests.map((request) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 200, top: 10),
                      child: Container(
                        width: 520,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 236, 236, 236),
                          borderRadius: BorderRadiusDirectional.circular(8),
                          border: Border.all(
                            color: const Color.fromARGB(255, 225, 225, 225),
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 80,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8, top: 4),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    request.isRequest ? "Claim" : "Cancel",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: request.isRequest ? const Color.fromARGB(255, 131, 120, 238) : const Color.fromARGB(255, 238, 147, 141),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 300,
                              child: Text(
                                request.description,
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                request.date,
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Text(
                              request.userID,
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
