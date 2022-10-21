import 'package:hive_flutter/hive_flutter.dart';

class ToDoModel {
  List toDoList = [];

  final _mybox = Hive.box('mybox'); //reference

  void createInitialData() {
    toDoList = [
      ["I'm ready for use app", false],
    ];
  }

  void updateData() {
    _mybox.put("TODOLİST", toDoList);
  }

  void loadData() {
    toDoList = _mybox.get("TODOLİST");
  }
}
