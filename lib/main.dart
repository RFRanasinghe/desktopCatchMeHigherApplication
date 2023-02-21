import 'dart:js';

import 'package:desktopcatchmehigher/activityHome.dart';
import 'package:desktopcatchmehigher/colorFilling.dart';
import 'package:desktopcatchmehigher/colorSelection.dart';
import 'package:desktopcatchmehigher/countingNum.dart';
import 'package:desktopcatchmehigher/patternRecognition.dart';
import 'package:desktopcatchmehigher/welcomepage.dart';
import 'package:desktopcatchmehigher/existingprofile.dart';
import 'package:desktopcatchmehigher/newprofile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Catch Me Higher with Down Syndrome",
    debugShowCheckedModeBanner: false,
    initialRoute: 'welcomepage',
    routes: {
      'welcomepage': (context) => WelcomePage(),
      'newprofile': (context) => NewProfile(),
      'existingprofile': (context) => ExistingProfile(),
      'activityHome':(context) => ActivityHomePage(),
      'colorSelection':(context) => ColorSelection(),
      'colorFilling':(context) => ColorFillingPage(),
      'countingNum':(context) => CountingNumbers(),
      'patternRecognition':(context) => PatternRecognition()
    },
  ));
}
