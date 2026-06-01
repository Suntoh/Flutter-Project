import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    super.key,
    required this.taskName,
    required this.isDone,
    this.onChanged,
    this.onDelete,
  });

  final String taskName;
  final bool isDone;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            CustomSlidableAction(
              onPressed: onDelete,
              backgroundColor: Colors.transparent,
              child: Container(
                width: double.maxFinite,
                height: double.infinity,
                constraints: const BoxConstraints(maxWidth: 128),
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete, color: Colors.white),
                    Text(
                      'Delete',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade400,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
            child: Row(
              children: [
                Checkbox(
                  value: isDone,
                  onChanged: onChanged,
                  activeColor: Colors.deepPurple.shade200,
                  checkColor: Colors.white,
                  fillColor: WidgetStateProperty.all(
                    Colors.deepPurple.shade200,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: BorderSide(color: Colors.deepPurple.shade900),
                ),
                const SizedBox(width: 12), // gap between checkbox and text
                Text(
                  taskName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 3,
                    decorationColor: Colors.deepPurple.shade800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
