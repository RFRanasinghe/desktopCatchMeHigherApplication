import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorSelection extends StatefulWidget {
  const ColorSelection({Key? key}) : super(key: key);

  @override
  _ColorSelectionState createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(
          child: Text("Color Selection Activity"),
        ),
      ),
    );
  }
}