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

  void dellete(index) {
    setState(() {
      database.toDoList.removeAt(index);
      database.updateData();
    });
  }

  void changeCheckBox(int index) {
    setState(() {
      database.toDoList[index][1] = !database.toDoList[index][1];
      database.complatedList.add(index);
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
    log((" to do ${database.toDoList.length}"));
    log((" count ${database.toDoCount}"));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 15, top: 20),
          child: Text(
            "To Do",
            style: CustomTextStyle.appBarTitle,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 16,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: database.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                toDoText: database.toDoList[index][0],
                isDone: database.toDoList[index][1],
                change: () => changeCheckBox(index),
                dellete: () => dellete(index),
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
                  hintStyle: _toDoTextStye,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          )
        ]),
      ),
    );
  }
}
