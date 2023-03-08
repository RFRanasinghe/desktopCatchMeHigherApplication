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
              image: AssetImage('images/actBg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: InkWell(
              onTap: () => print("ciao"),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 900,
                    height: 600,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
