import 'dart:js';

import 'package:desktopcatchmehigher/activityHome.dart';
import 'package:desktopcatchmehigher/colorFilling.dart';
import 'package:desktopcatchmehigher/colorSelection.dart';
import 'package:desktopcatchmehigher/countTwo.dart';
import 'package:desktopcatchmehigher/countingNum.dart';
import 'package:desktopcatchmehigher/patternRecognition.dart';
import 'package:desktopcatchmehigher/selectionThree.dart';
import 'package:desktopcatchmehigher/selectionTwo.dart';
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
      'activityHome': (context) => ActivityHomePage(),
      'colorSelection': (context) => ColorSelection(),
      'selectionTwo': (context) => SelectionActivityTwoPage(),
      'selectionThree': (context) => SelectionActivityThreePage(),
      'colorFilling': (context) => ColorFillingPage(),
      'countingNum': (context) => CountingNumbers(),
      'countTwo': (context) => CountTwoActivity(),
      'patternRecognition': (context) => PatternRecognition()
    },
  ));
}
