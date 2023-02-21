import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityHomePage extends StatefulWidget {
  const ActivityHomePage({Key? key}) : super(key: key);

  @override
  _ActivityHomePageState createState() => _ActivityHomePageState();
}

class _ActivityHomePageState extends State<ActivityHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Activity House"),
        ),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          new ElevatedButton(
            child: new Text("Color Selection"),
            onPressed: () {
              Navigator.pushNamed(context, 'colorSelection');
            },
          ),
          new ElevatedButton(
              child: new Text("Color Filling"),
              onPressed: () {
                Navigator.pushNamed(context, 'colorFilling');
              }),
          new ElevatedButton(
            child: new Text("Counting Numbers"),
            onPressed: () {
              Navigator.pushNamed(context, 'countingNum');
            }
          ),
          new ElevatedButton(
              child: new Text("Pattern Recognition"),
              onPressed: () {
                Navigator.pushNamed(context, '');
              })
        ],
      )),
    );
  }
}
