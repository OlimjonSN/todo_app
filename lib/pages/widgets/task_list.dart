import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/task_model.dart';
import 'task_item.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> list;
  final Function isDone;
  final Function deleteTask;
  const TaskList({
    required this.deleteTask,
    required this.isDone,
    required this.list,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: list.length > 0
            ? ListView.builder(
                itemCount: list.length,
                itemBuilder: ((context, index) {
                  return TaskItem(task: list[index], isDone: isDone, deleteTask: deleteTask);
                }))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sizda hozircha vazifa yo\'q...',
                    style: GoogleFonts.aladin(color: Colors.green, fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.network('https://offthewallplays.com/wp-content/uploads/2020/05/man-sleeping-on-couch-vector-clipart-2048x1589.png'),
                  )
                ],
              ));
  }
}
