import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:velocity_x/velocity_x.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  }) : super(key: key);

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  Function(BuildContext context)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // CheckBox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                checkColor: context.theme.colorScheme.surface,
                activeColor: context.theme.colorScheme.onSurface,
              ),
              // Task Name
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  decoration: taskCompleted
                      ? (TextDecoration.lineThrough)
                      : (TextDecoration.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
