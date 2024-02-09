import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:jumperdates/widgets/request_button.dart';
import 'package:jumperdates/widgets/request_details.dart';

import '../widgets/date.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DateTime selectedDate = DateTime.now();
  TextEditingController descriptionController = TextEditingController();
  Color ashtonColour = Colors.red;
  Color harryColour = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          "JumperDates",
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
                    RequestButton(date: selectedDate, description: descriptionController.text),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 200, top: 32),
                  child: Container(
                    width: 520,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 236, 236),
                      borderRadius: BorderRadiusDirectional.circular(8),
                      border: Border.all(color: const Color.fromARGB(255, 225, 225, 225), width: 2)
                    ),
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      onChanged: (value) => setState(() {}),
                      maxLines: null,
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 236, 236, 236),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
