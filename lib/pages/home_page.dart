import 'package:flutter/material.dart';
import '../constans.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _title = title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          _title,
          style:
              Theme.of(context).textTheme.headline3?.copyWith(color: textColor),
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
                value: false,
                onChanged: null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            title: Text(" Do Homeworkkk"),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), label: "Home Page"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black), label: "Home Page")
        ],
      ),
    );
  }
}
