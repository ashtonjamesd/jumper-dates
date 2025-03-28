import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:jumperdates/services/jumper.dart';
import 'package:jumperdates/widgets/booking_box.dart';
import 'package:jumperdates/widgets/description_box.dart';
import 'package:jumperdates/widgets/request_button.dart';
import 'package:jumperdates/widgets/request_details.dart';

import '../widgets/date.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DateTime selectedDate = DateTime.now();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          "Jumper Dates",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 82, 82, 82),
            letterSpacing: 1
          ),
        ),
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
          )
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 120,
                width: 1200,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Colors.grey,
                      width: 2
                    ),
                    right: BorderSide(
                      color: Colors.grey,
                      width: 2
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Date(
                        occupant: "",
                        date: DatePicker(
                          height: 100,
                          DateTime.now(),
                          initialSelectedDate: DateTime.now(),
                          selectionColor: const Color.fromARGB(255, 229, 229, 229),
                          selectedTextColor: const Color.fromARGB(255, 52, 52, 52),
                          onDateChange: (date) {
                            setState(() {
                              selectedDate = date;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: RequestDetails(date: selectedDate),
                    ),
                     RequestButton(
                       date: selectedDate, 
                       description: descriptionController.text,
                       onRequestSent: () {
                         showSnackbar(context);
                       },
                     ),
                  ],
                ),
                DescriptionBox(
                  descriptionController: descriptionController,
                  onDescriptionChanged: () => setState(() {}),           
                ),
                const BookingBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          JumperService.getSuccess() ? "Successfully sent jumper request!" 
          : "Failed to send jumper request.",
          style: TextStyle(
            color: JumperService.getSuccess() ? const Color.fromARGB(255, 131, 120, 238) : const Color.fromARGB(255, 238, 147, 141),
          ),
        ),
      ),
    );
    JumperService.wasSuccess = false;
  }
}
