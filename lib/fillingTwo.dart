import 'package:desktopcatchmehigher/colorFilling.dart';
import 'package:desktopcatchmehigher/widget/fillingThree.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorFillingSecondPage extends StatefulWidget {
  const ColorFillingSecondPage({Key? key}) : super(key: key);

  @override
  _ColorFillingSecondPageState createState() => _ColorFillingSecondPageState();
}

class _ColorFillingSecondPageState extends State<ColorFillingSecondPage> {
  List<Color> stack1 = [Colors.red, Colors.blue];
  List<Color> stack2 = [Colors.green];

  Widget buildStack(List<Color> stack) => DragTarget<Color>(
      onAccept: (data) {
        setState(() {
          stack.add(data);
        });
      },
      builder: (context, _, __) => Stack(
            children: [
              Container(
                color: Colors.black,
                width: 100,
                height: 100,
                child: const Center(child: Text('Empty')),
              ),
              ...stack.map(buildStackItem).toList(),
            ],
          ));

  Widget buildStackItem(Color color) {
    final coloredBox = Container(
      color: color,
      width: 100,
      height: 100,
    );

    return Draggable<Color>(
      data: color,
      child: coloredBox,
      feedback: coloredBox,
      childWhenDragging: const SizedBox(width: 100, height: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Color Filling Activity - Page 2"),
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
                'images/fish.jpg',
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
                        "Select the color of this fish?",
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
              padding: const EdgeInsets.only(top: 530.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildStack(stack1),
                  buildStack(stack2),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300.0, left: 80.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ColorFillingPage()),
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
                        builder: (context) => ColorFillingThirdPage()),
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
