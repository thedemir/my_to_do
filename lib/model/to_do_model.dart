class ToDoModel {
  int? id;
  String toDoText;
  bool isDone;

  ToDoModel({required this.id, required this.toDoText, this.isDone = false});

  static List<ToDoModel> toDoList = [
    ToDoModel(id: 1, toDoText: "Do Homework"),
    ToDoModel(id: 2, toDoText: "Make Logo"),
  ];
}
