import 'package:flutter/material.dart';
import '../data.dart';

class RequestDetails extends StatefulWidget {
  const RequestDetails({Key? key, required this.date});

  final DateTime date;

  @override
  State<RequestDetails> createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  late DateTime selectedDate;
  String selectedRequestType = ""; // Set default value to an empty string
  String selectedPerson = ""; // Set default value to an empty string

  @override
  void initState() {
    super.initState();
    selectedDate = widget.date;
  }

  @override
  void didUpdateWidget(RequestDetails oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.date != selectedDate) {
      setState(() {
        selectedDate = widget.date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 520,
      height: 40,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 243, 243),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: const Color.fromARGB(255, 225, 225, 225), width: 2),  
      ),      
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 8),
            child: Text(
              "I am requesting a",
              style: TextStyle(fontSize: 12),
            ),
          ),
          DropdownMenu(
            textStyle: const TextStyle(fontSize: 12, color: Colors.black),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "", label: "Select"), // Added default empty value
              DropdownMenuEntry(value: "CL", label: "Claim"),
              DropdownMenuEntry(value: "CA", label: "Cancel"),
            ],
            selectedValue: selectedRequestType,
            onChanged: (String? value) {
              setState(() {
                selectedRequestType = value ?? "";
                tempIsRequestVal = value ?? "";
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text(
              "for",
              style: TextStyle(fontSize: 12),
            ),
          ),
          DropdownMenu(
            textStyle: const TextStyle(fontSize: 12, color: Colors.black),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "", label: "Select"), // Added default empty value
              DropdownMenuEntry(value: "AD", label: "Ashton Dunderdale"),
              DropdownMenuEntry(value: "HO", label: "Harrison O'Leary"),
            ],
            selectedValue: selectedPerson,
            onChanged: (String? value) {
              setState(() {
                selectedPerson = value ?? "";
                tempPersonVal = value ?? "";
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 16),
            child: Text(
              "on ${selectedDate.toString().substring(0, selectedDate.toString().length - 13)}",
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownMenu extends StatelessWidget {
  const DropdownMenu({
    Key? key,
    required this.dropdownMenuEntries,
    required this.textStyle,
    required this.selectedValue,
    required this.onChanged,
  });

  final List<DropdownMenuEntry> dropdownMenuEntries;
  final TextStyle textStyle;
  final String selectedValue;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      items: dropdownMenuEntries.map((entry) {
        return DropdownMenuItem<String>(
          value: entry.value,
          child: Text(entry.label),
        );
      }).toList(),
      onChanged: onChanged,
      style: textStyle,
    );
  }
}

class DropdownMenuEntry<T> {
  final T value;
  final String label;

  const DropdownMenuEntry({required this.value, required this.label});
}
