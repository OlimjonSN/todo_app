import 'package:flutter/material.dart';

import 'package:todo_app/pages/widgets/add_task_windows.dart';

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
  DateTime? selectedtaskDate;

  void selectDate(BuildContext context) {
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2050)).then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });
      }
    });
  }

  void addTaskFunction(String title, DateTime date) {
    setState(() {
      tasks.addTodoTask(title, date);
    });
  }

  void addTask() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return AddTaskWindow(addTaskFunction: addTaskFunction);
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
      tasks.todoByDay(selectedDate).firstWhere((element) => element.id == taskID).toggleDone();
    });
  }

  void deleteTask(String taskID) {
    setState(() {
      tasks.list.removeWhere((element) => element.id == taskID);
    });
  }

  int get isDoneCount {
    return tasks.todoByDay(selectedDate).where((element) => element.isDone).length;
  }

  final Tasks tasks = Tasks();

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
              TodoCount(count: tasks.todoByDay(selectedDate).length, title: 'Barcha rejalaringiz'),
              TodoCount(count: isDoneCount, title: 'Tugatilgan rejalaringiz', isStartPosition: false),
            ],
          ),

          // ? rejalarni ko'rsatish uchun
          TaskList(list: tasks.todoByDay(selectedDate), isDone: isDone, deleteTask: deleteTask)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTask();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
