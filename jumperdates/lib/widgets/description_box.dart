import 'package:flutter/material.dart';

class DescriptionBox extends StatefulWidget {
  const DescriptionBox({super.key, required this.onDescriptionChanged, required this.descriptionController});

  final VoidCallback onDescriptionChanged;
  final TextEditingController descriptionController;

  @override
  State<DescriptionBox> createState() => _DescriptionBoxState();
}

class _DescriptionBoxState extends State<DescriptionBox> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 200, top: 32),
      child: SizedBox(
        width: 520,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  "DESCRIPTION",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500
                  ),
                ),
              )
            ),          
            Container(
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
                onChanged: (value) {
                  widget.onDescriptionChanged();
                },
                maxLines: null,
                controller: widget.descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 236, 236, 236),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}