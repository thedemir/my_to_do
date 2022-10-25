import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_to_do/model/to_do_model.dart';
import 'package:my_to_do/pages/to_do_view.dart';
import 'package:my_to_do/widgets/overview_card.dart';
import '../constans.dart';

class OverView extends StatefulWidget {
  const OverView({Key? key}) : super(key: key);

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  ToDoModel database = ToDoModel();
  late int toDoCount;

  @override
  void initState() {
    database.loadData();
    toDoCount = database.complatedList.length;
  }

  @override
  Widget build(BuildContext context) {
    log((" overview ${database.toDoList.length}"));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 15, top: 20),
          child: Text(
            "Overview",
            style: CustomTextStyle.appBarTitle,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              OverViewCart(
                  title: "Current Task", count: database.toDoList.length),
              OverViewCart(
                  title: "Comming Soon", count: database.complatedList.length),
              OverViewCart(title: "Coming Soon...", count: 0),
            ],
          ),
        ),
      ),
    );
  }
}
