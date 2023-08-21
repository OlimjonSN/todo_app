class TaskModel {
  final String id;
  final String name;
  final DateTime date;
  bool isDone = false;

  TaskModel({required this.id, required this.name, required this.date});

  void toggleDone() {
    isDone = !isDone;
  }
}

class Tasks {
  final List<TaskModel> _list = [
    TaskModel(id: '1', name: 'Flutter dars qilish', date: DateTime.now()),
    TaskModel(id: '2', name: 'Portfolio uchun ishlash', date: DateTime.now()),
    TaskModel(id: '3', name: 'suhbatga tayorlanish', date: DateTime.now()),
  ];
  List<TaskModel> get list => _list;

  List<TaskModel> todoByDay(
    DateTime day,
  ) {
    return _list.where((element) => element.date.day == day.day && element.date.month == day.month && element.date.year == day.year).toList();
  }

  void addTodoTask(String title, DateTime date) {
    _list.insert(0, TaskModel(id: DateTime.now().toString(), name: title, date: date));
  }
}
