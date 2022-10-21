import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_to_do/model/to_do_model.dart';
import 'package:my_to_do/widgets/to_do_tile.dart';
import '../constans.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _HomePageState();
}

class _HomePageState extends State<ToDoPage> {
  final _toDoTextStye = CustomTextStyle.toDoTextStyle;
  int _currentindex = 0;
  //text controller
  final _textController = TextEditingController();

  //reference
  ToDoModel database = ToDoModel();
  final _mybox = Hive.box("mybox");

  // first run app
  @override
  void initState() {
    if (_mybox.get("TODOLİST") == null) {
      database.createInitialData();
    } else {
      database.loadData();
    }
    super.initState();
  }

  int currentTaskCount() {
    int counter = database.toDoList.length;
    return counter;
  }

  void changeCheckBox(int index) {
    setState(() {
      database.toDoList[index][1] = !database.toDoList[index][1];
    });
    print("çalıştı");
  }

  void CreateNewTask() {
    setState(() {
      String taskTitle = _textController.text;
      database.toDoList.add([taskTitle, false]);
      database.updateData();
      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    log(("${database.toDoList.length}"));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 15, top: 20),
          child: Text(
            "To Do",
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
            itemCount: database.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                toDoText: database.toDoList[index][0],
                isDone: database.toDoList[index][1],
                change: () => changeCheckBox(index),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: TextField(
              // TEXT FİELD
              onEditingComplete: () => CreateNewTask(),
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
    );
  }
}
