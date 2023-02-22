import 'package:flutter/material.dart';

class PatternRecognition extends StatefulWidget {
  const PatternRecognition({Key? key}) : super(key: key);

  @override
  _PatternRecognitionState createState() => _PatternRecognitionState();
}

class _PatternRecognitionState extends State<PatternRecognition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Pattern Recognition Activity"),
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
        ),
      ),
    );
  }
}
