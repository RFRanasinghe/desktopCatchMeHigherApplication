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
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: SizedBox(
                    width: 400,
                    child: new ElevatedButton(
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
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: SizedBox(
                    width: 400,
                    child: new ElevatedButton(
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
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: SizedBox(
                    width: 400,
                    child: new ElevatedButton(
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
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: SizedBox(
                    width: 400,
                    child: new ElevatedButton(
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
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
