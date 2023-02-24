import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountingNumbers extends StatefulWidget {
  const CountingNumbers({Key? key}) : super(key: key);

  @override
  _CountingNumbersState createState() => _CountingNumbersState();
}

class _CountingNumbersState extends State<CountingNumbers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Counting Numbers Activity"),
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
