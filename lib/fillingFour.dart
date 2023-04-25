import 'package:desktopcatchmehigher/activityHome.dart';
import 'package:desktopcatchmehigher/fillingTwo.dart';
import 'package:desktopcatchmehigher/widget/fillingThree.dart';
import 'package:flutter/material.dart';

class ColorFillingFourthPage extends StatefulWidget {
  const ColorFillingFourthPage({Key? key}) : super(key: key);

  @override
  _ColorFillingFourthPageState createState() => _ColorFillingFourthPageState();
}

class _ColorFillingFourthPageState extends State<ColorFillingFourthPage> {
  // List<ItemModel> items;
  // List<ItemModel> items2;

  // int score;
  // bool gameOver;

  // @override
  // void initState() {
  //   super.initState();
  //   initGame();
  // }

  // initGame() {
  //   gameOver = false;
  //   score = 0;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Color Filling Activity - Page 4"),
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
            Positioned(
              top: 100,
              left: 200,
              child: Image.asset(
                'images/pig.png',
                height: 400,
                width: 400,
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
                        "Select the color of this dear?",
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
              padding: const EdgeInsets.all(60),
              // child: Column(
              //   children: <Widget>[
              //     Text.rich(TextSpan(
              //       children: [
              //         TextSpan(text: "Score: "),
              //         TextSpan(
              //             text: "$score",
              //             style: TextStyle(
              //               color: Colors.green,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 30,
              //             )),
              //       ],
              //     ))
              //   ],
              // ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300.0, left: 80.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ColorFillingThirdPage()),
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
                    MaterialPageRoute(builder: (context) => ActivityHomePage()),
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
