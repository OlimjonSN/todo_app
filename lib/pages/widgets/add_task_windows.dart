import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddTaskWindow extends StatefulWidget {
  final Function addTaskFunction;
  const AddTaskWindow({required this.addTaskFunction, super.key});

  @override
  State<AddTaskWindow> createState() => _AddTaskWindowState();
}

class _AddTaskWindowState extends State<AddTaskWindow> {
  final TextEditingController titleController = TextEditingController();
  DateTime? selectedtaskDate;

  void taskDate(BuildContext context) {
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2050)).then((value) {
      if (value != null) {
        setState(() {
          selectedtaskDate = value;
        });
      }
    });
  }

  void submitTask() {
    if (titleController.text.isEmpty || selectedtaskDate == null) {
      return;
    }
    widget.addTaskFunction(titleController.text, selectedtaskDate!);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).viewInsets.bottom);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? MediaQuery.of(context).viewInsets.bottom + 10 : 100, left: 20, right: 20, top: 20),
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
                // ignore: unnecessary_null_comparison
                selectedtaskDate == null ? 'Reja kuni tanlanmagan...' : DateFormat('EEEE d MMM y').format(selectedtaskDate!),
                style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins().fontFamily),
              ),
              TextButton(onPressed: () => taskDate(context), child: Text('Kunni Tanlash', style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins().fontFamily)))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Bekor qilish', style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: GoogleFonts.poppins().fontFamily))),
              const SizedBox(width: 20),
              ElevatedButton(
                  onPressed: () {
                    submitTask();
                  },
                  child: Text(
                    'Qo\'shish',
                    style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins().fontFamily),
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
