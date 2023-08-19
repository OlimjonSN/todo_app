import 'package:flutter/material.dart';

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
          DateTodo(selectDate: selectDate, date: selectedDate, decreaseDate: decreaseDate, increaseDate: increaseDate),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TodoCount(count: 03, title: 'Barcha rejalaringiz'),
              TodoCount(count: 00, title: 'Tugatilgan rejalaringiz', isStartPosition: false),
            ],
          ),
          const TaskList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
