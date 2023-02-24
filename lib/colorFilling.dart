import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorFillingPage extends StatefulWidget {
  const ColorFillingPage({Key? key}) : super(key: key);

  @override
  _ColorFillingPageState createState() => _ColorFillingPageState();
}

class _ColorFillingPageState extends State<ColorFillingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Color Filling Activity"),
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/galaxy.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: 1300,
            height: 600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
