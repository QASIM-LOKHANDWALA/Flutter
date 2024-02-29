import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: context.backgroundColor,
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
              cursorColor: context.theme.colorScheme.onSurface,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black
                  )
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white
                    )
                ),
                hintText: "Enter your task",
                focusColor: context.theme.colorScheme.onSurface,
                hoverColor: context.theme.colorScheme.onSurface,
                hintStyle: TextStyle(
                  color: context.theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w400
                )
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
