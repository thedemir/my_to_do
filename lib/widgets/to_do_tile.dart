import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../constans.dart';

class ToDoTile extends StatelessWidget {
  final String toDoText;
  final bool isDone;
  final Function change;
  final Function dellete;
  ToDoTile(
      {Key? key,
      required this.toDoText,
      required this.isDone,
      required this.change,
      required this.dellete})
      : super(key: key);
  final _toDoTextStye = CustomTextStyle.toDoTextStyle;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (index) => dellete(),
            backgroundColor: Colors.black,
            icon: Icons.delete_outline,
          ),
        ],
      ),
      child: ListTile(
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
      ),
    );
  }
}
