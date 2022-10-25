import 'package:hive_flutter/hive_flutter.dart';

class ToDoModel {
  List toDoList = [];
  List complatedList = [];
  int toDoCount = 0;

  final _mybox = Hive.box('mybox'); //reference

  void createInitialData() {
    toDoList = [
      ["I am ready for start", false],
    ];
  }

  void updateData() {
    _mybox.put("TODOLİST", toDoList);
  }

  void loadData() {
    toDoList = _mybox.get("TODOLİST");
  }
}
