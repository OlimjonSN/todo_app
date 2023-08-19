import 'package:flutter/material.dart';

import '../models/task_model.dart';
import 'widgets/date_todo.dart';
import 'widgets/task_list.dart';
import 'widgets/todo_count.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  DateTime selectedDate = DateTime.now();

  void selectDate(BuildContext context) {
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2050)).then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });
      }
    });
  }

  void decreaseDate() {
    setState(() {
      selectedDate = selectedDate.subtract(const Duration(days: 1));
    });
  }

  void increaseDate() {
    setState(() {
      selectedDate = selectedDate.add(const Duration(days: 1));
    });
  }

  void isDone(String taskID) {
    setState(() {
      tasks.firstWhere((element) => element.id == taskID).toggleDone();
    });
  }

  void deleteTask(String taskID) {
    setState(() {
      tasks.removeWhere((element) => element.id == taskID);
    });
  }

  int get isDoneCount {
    return tasks.where((element) => element.isDone).length;
  }

  final List<TaskModel> tasks = Tasks().list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text('Todo App'),
      ),
      body: Column(
        children: [
          // ? tanlangan vaqtni ko'rsatish uchun
          DateTodo(selectDate: selectDate, date: selectedDate, decreaseDate: decreaseDate, increaseDate: increaseDate),

          // ? rejalarni bajarilgan va bajarilmaganlarini ko'rsatish uchun
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TodoCount(count: tasks.length, title: 'Barcha rejalaringiz'),
              TodoCount(count: isDoneCount, title: 'Tugatilgan rejalaringiz', isStartPosition: false),
            ],
          ),

          // ? rejalarni ko'rsatish uchun
          TaskList(list: tasks, isDone: isDone, deleteTask: deleteTask)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
