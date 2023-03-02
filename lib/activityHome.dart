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
      body: Center(
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/papertool.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new Text(
                      "Color Selection",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'colorSelection');
                  },
                ),
                new ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new Text(
                        "Color Filling",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'colorFilling');
                    }),
                new ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new Text(
                        "Counting Numbers",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'countingNum');
                    }),
                new ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new Text(
                        "Pattern Recognition",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'patternRecognition');
                    })
              ],
            )),
      ),
    );
  }
}
