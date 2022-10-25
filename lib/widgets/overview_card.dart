import 'package:flutter/material.dart';
import 'package:my_to_do/constans.dart';

class OverViewCart extends StatelessWidget {
  final String title;
  final int count;
  const OverViewCart({Key? key, required this.count, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          border: Border.all(width: 0.8),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              Text(
                "$count",
                style: TextStyle(color: Colors.black, fontSize: 75),
              )
            ],
          ),
        ),
      ),
    );
  }
}
