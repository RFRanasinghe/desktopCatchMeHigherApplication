import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExistingProfile extends StatefulWidget {
  const ExistingProfile({Key? key}) : super(key: key);

  @override
  _ExistingProfileState createState() => _ExistingProfileState();
}

class _ExistingProfileState extends State<ExistingProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Existing Profile"),
        ),
      ),
    );
  }
}
