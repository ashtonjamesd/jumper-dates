import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:jumperdates/widgets/request_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late DateTime selectedDate = DateTime.now();

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
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 400,
              width: 1200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePicker(
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
                ],
              ),
            ),
          ),
          RequestButton(date: selectedDate),
        ],
      ),
    );
  }
}