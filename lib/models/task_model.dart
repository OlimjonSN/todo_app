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
}
