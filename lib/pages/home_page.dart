import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_to_do/pages/over_view.dart';
import 'package:my_to_do/pages/to_do_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabs = [ToDoPage(), OverView()];
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: ((index) {
          setState(() {
            _currentindex = index;
          });
        }),
        selectedItemColor: Colors.black,
        currentIndex: _currentindex,
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
