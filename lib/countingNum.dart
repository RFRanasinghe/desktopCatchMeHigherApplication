import 'package:desktopcatchmehigher/activityHome.dart';
import 'package:desktopcatchmehigher/countTwo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'logged_in_user_model.dart';

class CountingNumbers extends StatefulWidget {
  const CountingNumbers({Key? key}) : super(key: key);

  @override
  _CountingNumbersState createState() => _CountingNumbersState();
}

class _CountingNumbersState extends State<CountingNumbers> {
  var correctAnswer = false;
  var incorrectAnswer = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Counting Numbers Activity"),
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
                padding: const EdgeInsets.only(top: 450.0, left: 700.0),
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
              ),
            ),
            Positioned(
              top: -30,
              left: 500,
              child: Image.asset(
                'images/stick.png',
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
                        "How many popsticks are there?",
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
                        incorrectAnswer = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "3",
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
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "2",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      handleCorrectButtonPress();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "5",
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
                      backgroundColor: Color.fromARGB(255, 18, 99, 51),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "6",
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
                    MaterialPageRoute(builder: (context) => ActivityHomePage()),
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
                    MaterialPageRoute(builder: (context) => CountTwoActivity()),
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

  Future<void> handleCorrectButtonPress() async {
    setState(() {
      correctAnswer = true;
    });
    final uid = Provider.of<LoggedInUserModel>(context, listen: false)
        .loggedInUser!
        .uid;

    try {
      final docRef = FirebaseFirestore.instance
          .collection('students')
          .where('uid', isEqualTo: uid)
          .limit(1)
          .get();

      final snapshot = await docRef;

      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        final data = doc.data();

        if (data.containsKey('countSelectionMarks')) {
          final currentMarks = data['countSelectionMarks'] as int;
          await doc.reference.update({'countSelectionMarks': currentMarks + 1});
        } else {
          await doc.reference.update({'countSelectionMarks': 1});
        }
      }
    } catch (error) {
      print('Error updating marks: $error');
    }

    Future.delayed(Duration(seconds: 2)).then((value) => {
          setState(() {
            correctAnswer = false;
          }),
          Navigator.pushNamed(context, 'countTwo'),
        });
  }
}
