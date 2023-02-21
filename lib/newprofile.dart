import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewProfile extends StatefulWidget {
  const NewProfile({Key? key}) : super(key: key);

  @override
  _NewProfileState createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("New Profile"),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/welcomeImg.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Center(child: Text("Hello")),
            ),
            Center(
              child: ElevatedButton(
                child: Text("New Profile Button"),
                onPressed: () {
                  Navigator.pushNamed(context, 'existingprofile');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
