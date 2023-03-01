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
        title: Center(
          child: Text("Color Selection Activity"),
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
