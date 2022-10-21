import 'package:flutter/material.dart';
import 'package:my_to_do/pages/home_page.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              // padding: const EdgeInsets.only(left: 15, top: 80, bottom: 40),
              heightFactor: 4,
              child: Text(
                "Overview",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Completed Task",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: textColor, fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 20,
                ),
                Text("17",
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: textColor, fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomButtomNavBar(),
    );
  }
}
