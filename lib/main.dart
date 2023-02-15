import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MaterialApp(
    title: 'Catch-Me-Higher Desktop Application',
    home: WelcomeForm(),
  ));
}

class WelcomeForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomeFormState();
  }
}

class _WelcomeFormState extends State<WelcomeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to CatchMeHigher'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            getImageAsset(),
          ],
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/welcomeImg.jpg');
    Image image = Image(image: assetImage, width: 800.0, height: 800.0);

    return Container(
      child: image,
    );
  }
}
