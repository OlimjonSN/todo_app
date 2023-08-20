import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  TextEditingController titleController = TextEditingController();

  void selectDate(BuildContext context) {
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2050)).then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });
      }
    });
  }

  void addTask() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'title',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reja kuni tanlanmagan...',
                    style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                  TextButton(onPressed: () => selectDate(context), child: Text('Kunni Tanlash', style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins().fontFamily)))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {}, child: Text('Bekor qilish', style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: GoogleFonts.poppins().fontFamily))),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Qo\'shish',
                        style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins().fontFamily),
                      )),
                ],
              )
            ]),
          );
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
        onPressed: () {
          addTask();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
