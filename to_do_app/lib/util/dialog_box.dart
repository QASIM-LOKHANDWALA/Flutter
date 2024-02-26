import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController myController;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
    {
      super.key,
      required this.myController,
      required this.onSave,
      required this.onCancel,
    }
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[300],
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // To Take User Input
            TextField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your task",
              ),
            ),
            // Save & Cancel Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // SAVE
                MyButton(text: "SAVE", onPressed: onSave),
                const SizedBox(
                  width: 8,
                ),
                // CANCEL
                MyButton(text: "CANCEL", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
