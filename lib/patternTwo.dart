import 'package:desktopcatchmehigher/patternRecognition.dart';
import 'package:desktopcatchmehigher/patternThree.dart';
import 'package:flutter/material.dart';

class PatternTwoActivity extends StatefulWidget {
  const PatternTwoActivity({Key? key}) : super(key: key);

  @override
  _PatternTwoActivityState createState() => _PatternTwoActivityState();
}

class _PatternTwoActivityState extends State<PatternTwoActivity> {
  var correctAnswer = false;
  var incorrectAnswer = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Pattern Recognition Activity"),
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
                  top: 50.0, left: 80.0, bottom: 70, right: 80.0),
            ),
            Visibility(
              visible: correctAnswer,
              child: Padding(
                padding: const EdgeInsets.only(top: 450.0, left: 80.0),
                child: Image.asset(
                  'videos/wonFree.gif',
                  height: 200.0,
                  width: 200.0,
                ),
              ),
            ),
            Visibility(
                visible: incorrectAnswer,
                child: Image.asset(
                  'videos/wrong.gif',
                  height: 200.0,
                  width: 200.0,
                )),
            Positioned(
              top: 5,
              left: 600,
              child: Image.asset(
                'images/pq2.jpg',
                height: 600,
                width: 600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0, left: 100.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Select the next correct pattern?",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.select_all_sharp),
                        label: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Click Me",
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 160, 97, 2),
                        ),
                      ),
                      ElevatedButton.icon(
                        icon: Icon(Icons.try_sms_star_sharp),
                        onPressed: () {},
                        label: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Try Again",
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 1, 37, 66),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.stop_sharp),
                        label: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "FINISH",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 2, 66, 27),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 510.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        correctAnswer = true;
                      });
                      // Future.delayed(Duration(seconds: 6)).then((value) => {
                      //       setState(() {
                      //         correctAnswer = false;
                      //       }),
                      //     });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 43, 128, 103),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "a",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        incorrectAnswer = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 81, 11, 93),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "b",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        incorrectAnswer = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 153, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "c",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        incorrectAnswer = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 212, 39),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "d",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300.0, left: 80.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatternRecognition()),
                  );
                },
                child: Image.asset(
                  'images/left.jpg',
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 300.0, left: 1350.0, right: 30.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatternThreeActivityPage()),
                  );
                },
                child: Image.asset(
                  'images/right.jpg',
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
