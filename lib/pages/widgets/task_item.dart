import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final Function isDone;
  final Function deleteTask;
  const TaskItem({
    required this.deleteTask,
    required this.isDone,
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
          onPressed: () {
            isDone(task.id);
          },
          icon: Icon(
            task.isDone ? Icons.check_circle_outline : Icons.circle_outlined,
            color: task.isDone ? Colors.green : null,
          )),
      title: Text(
        task.name,
        style: task.isDone ? TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontFamily: GoogleFonts.poppins().fontFamily, fontWeight: FontWeight.bold) : TextStyle(fontFamily: GoogleFonts.poppins().fontFamily, fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        onPressed: () {
          deleteTask(task.id);
        },
        icon: const Icon(
          Icons.delete_forever_rounded,
          color: Colors.black,
        ),
      ),
    );
  }
}
