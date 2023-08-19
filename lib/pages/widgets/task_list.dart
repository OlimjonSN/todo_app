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
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: ((context, index) {
              return TaskItem(task: list[index], isDone: isDone, deleteTask: deleteTask);
            })));
  }
}
