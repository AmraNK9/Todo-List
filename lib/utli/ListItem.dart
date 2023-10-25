import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final List<dynamic> tasks;
  final VoidCallback onCheck;
  final VoidCallback onRemove;

  Task({
    Key? key,
    required this.tasks,
    required this.onCheck,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          tasks[0],
          style: TextStyle(
            decoration: tasks[1]
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        leading: Checkbox(
          value: tasks[1],
          onChanged: (value) => onCheck(),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onRemove,
        ),
      ),
    );
  }
}
