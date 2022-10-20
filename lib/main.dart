import 'package:flutter/material.dart';
import 'package:my_to_do/pages/home_page.dart';
import 'package:my_to_do/pages/over_view.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const OverView(),
    );
  }
}
