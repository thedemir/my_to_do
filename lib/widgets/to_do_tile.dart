import 'package:flutter/material.dart';
import '../constans.dart';

class ToDoTile extends StatelessWidget {
  final String toDoText;
  final bool isDone;
  final Function change;

  ToDoTile(
      {Key? key,
      required this.toDoText,
      required this.isDone,
      required this.change})
      : super(key: key);
  final _toDoTextStye = CustomTextStyle.toDoTextStyle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: Colors.black,
        value: isDone,
        onChanged: (value) => change(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      title: Text(
        toDoText,
        textAlign: TextAlign.left,
        style: _toDoTextStye,
      ),
    );
  }
}
