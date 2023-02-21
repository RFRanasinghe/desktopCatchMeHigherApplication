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
    );
  }
}
