import 'package:flutter/material.dart';
import 'package:my_to_do/model/to_do_model.dart';
import '../constans.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _title = title;
  final _toDoTextStye = CustomTextStyle.toDoTextStyle;
  final _textController = TextEditingController();

  void changeCheckBox(bool value, int index) {
    setState(() {
      ToDoModel.toDoList[index].isDone = !ToDoModel.toDoList[index].isDone;
    });
    print("çalıştı");
  }

  void CreateNewTask(int id) {
    setState(() {
      String taskTitle = _textController.text;
      ToDoModel.toDoList.add(ToDoModel(id: id, toDoText: taskTitle));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 15, top: 20),
          child: Text(
            _title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: ToDoModel.toDoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Checkbox(
                  activeColor: Colors.black,
                  value: ToDoModel.toDoList[index].isDone,
                  onChanged: (value) => changeCheckBox(value!, index),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                title: Text(
                  ToDoModel.toDoList[index].toDoText,
                  textAlign: TextAlign.left,
                  style: _toDoTextStye,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: TextField(
              // TEXT FİELD
              onEditingComplete: () => CreateNewTask(ToDoModel.toDoList.length),
              controller: _textController,
              style: _toDoTextStye,
              showCursor: true,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  icon: Checkbox(
                    value: false,
                    onChanged: null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  hintText: "New Task...",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: 0,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.black), label: "Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black), label: "Overview"),
        ],
      ),
    );
  }
}
