import 'package:audioplayers/audioplayers.dart';
import 'package:desktopcatchmehigher/activityHome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desktopcatchmehigher/countThree.dart';
import 'package:desktopcatchmehigher/existingprofile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logged_in_user_model.dart';

class CountFourActivity extends StatefulWidget {
  const CountFourActivity({Key? key}) : super(key: key);

  @override
  _CountFourActivityState createState() => _CountFourActivityState();
}

class _CountFourActivityState extends State<CountFourActivity> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  var correctAnswer = false;
  var incorrectAnswer = false;

  late AudioPlayer audioPlayer;
  String audioUrl = 'audio/sweets.mp3';

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loggedIn = Provider.of<LoggedInUserModel>(context);
    if (loggedIn.loggedInUser == null || loggedIn.loggedInUser!.uid!.isEmpty) {
      if (!_navigatorKey.currentState!.userGestureInProgress) {
        Navigator.pushNamed(context, 'userlogin');
        return Container();
      }
      return Container();
    } else {
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
                  padding: const EdgeInsets.only(top: 450.0, left: 400.0),
                  child: Image.asset(
                    'videos/wonFree.gif',
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
              ),
              Visibility(
                visible: incorrectAnswer,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0, left: 60),
                  child: Image.asset(
                    'videos/wrong.gif',
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 600,
                child: Image.asset(
                  'images/icecream.jpg',
                  height: 370,
                  width: 370,
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
                          "How many sweets are there?",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        ElevatedButton.icon(
                          icon: Icon(Icons.speaker),
                          onPressed: () async {
                            await audioPlayer.setSourceUrl(audioUrl);
                            await audioPlayer.resume();
                          },
                          label: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Listen to the question",
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
                          onPressed: () {
                            resetScoreAgain();
                          },
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ActivityHomePage()),
                            );
                          },
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
                        backgroundColor: Color.fromARGB(255, 239, 26, 97),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "20",
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
                        backgroundColor: Color.fromARGB(255, 204, 200, 200),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "14",
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
                        backgroundColor: Color.fromARGB(255, 122, 181, 230),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "24",
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
                        backgroundColor: Color.fromARGB(255, 2, 39, 69),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "18",
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
                          builder: (context) => CountThreeActivity()),
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
                padding: const EdgeInsets.only(
                    top: 300.0, left: 1350.0, right: 30.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActivityHomePage()),
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

  Future<void> handleCorrectButtonPress() async {
    setState(() {
      correctAnswer = true;
    });
    final uid = Provider.of<LoggedInUserModel>(context, listen: false)
        .loggedInUser!
        .uid;

    try {
      final docRef = FirebaseFirestore.instance
          .collection('scores')
          .where('uid', isEqualTo: uid)
          .where('date',
              isEqualTo: DateTime.now().toIso8601String().substring(0, 10))
          .limit(1)
          .get();

      final snapshot = await docRef;

      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        final data = doc.data();

        if (data.containsKey('countingNumbersMarks')) {
          final currentMarks = data['countingNumbersMarks'] as int;
          await doc.reference
              .update({'countingNumbersMarks': currentMarks + 1});
        } else {
          await doc.reference.update({'countingNumbersMarks': 1});
        }
      } else {
        await FirebaseFirestore.instance.collection('scores').add({
          'uid': uid,
          'countingNumbersMarks': 1,
          'date': DateTime.now().toIso8601String().substring(0, 10),
        });
      }
    } catch (error) {
      print('Error updating marks: $error');
    }

    Future.delayed(Duration(seconds: 2)).then((value) => {
          setState(() {
            correctAnswer = false;
          }),
          Navigator.pushNamed(context, 'activityHome'),
        });
  }

  Future<void> resetScoreAgain() async {
    final uid = Provider.of<LoggedInUserModel>(context, listen: false)
        .loggedInUser!
        .uid;

    try {
      final docRef = FirebaseFirestore.instance
          .collection('scores')
          .where('uid', isEqualTo: uid)
          .where('date',
              isEqualTo: DateTime.now().toIso8601String().substring(0, 10))
          .limit(1)
          .get();

      final snapshot = await docRef;

      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        final data = doc.data();

        if (data.containsKey('countingNumbersMarks')) {
          final currentMarks = data['countingNumbersMarks'] as int;
          await doc.reference.update({'countingNumbersMarks': 0});
        } else {
          await doc.reference.update({'countingNumbersMarks': 0});
        }
      } else {
        await FirebaseFirestore.instance.collection('scores').add({
          'uid': uid,
          'countingNumbersMarks': 0,
          'date': DateTime.now().toIso8601String().substring(0, 10),
        });
      }
      Navigator.pushNamed(context, 'countingNum');
    } catch (error) {
      print('Error updating marks: $error');
    }
  }
}
