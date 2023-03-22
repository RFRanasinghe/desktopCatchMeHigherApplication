import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectionActivityThreePage extends StatefulWidget {
  const SelectionActivityThreePage({Key? key}) : super(key: key);

  @override
  _SelectionActivityThreePageState createState() =>
      _SelectionActivityThreePageState();
}

class _SelectionActivityThreePageState
    extends State<SelectionActivityThreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Color Selection Activity"),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/screen.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.only(
                  top: 50.0, left: 80.0, bottom: 70.0, right: 80.0),
            ),
            Positioned(
              top: 100.0,
              left: 200.0,
              child: Image.asset(
                'images/seaLion.jpg',
                height: 400.0,
                width: 400.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
