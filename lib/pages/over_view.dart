import 'package:flutter/material.dart';
import 'package:my_to_do/pages/to_do_view.dart';
import '../constans.dart';

class OverView extends StatefulWidget {
  const OverView({Key? key}) : super(key: key);

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  @override
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
            "Overview",
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Current Task:   7",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: textColor, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
