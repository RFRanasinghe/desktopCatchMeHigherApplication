import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorFillingPage extends StatefulWidget {
  const ColorFillingPage({Key? key}) : super(key: key);

  @override
  _ColorFillingPageState createState() => _ColorFillingPageState();
}

class _ColorFillingPageState extends State<ColorFillingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Color Filling Activity"),
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
                      child: Image.asset(
                        'images/blackCar.png',
                        width: 300,
                        height: 150,
                        //fit: BoxFit.fill,
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
