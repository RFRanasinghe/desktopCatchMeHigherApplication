import 'dart:io';

import 'package:desktopcatchmehigher/activityHome.dart';
import 'package:desktopcatchmehigher/admin.dart';
import 'package:desktopcatchmehigher/colorFilling.dart';
import 'package:desktopcatchmehigher/colorSelection.dart';
import 'package:desktopcatchmehigher/countFour.dart';
import 'package:desktopcatchmehigher/countThree.dart';
import 'package:desktopcatchmehigher/countTwo.dart';
import 'package:desktopcatchmehigher/countingNum.dart';
import 'package:desktopcatchmehigher/patternFour.dart';
import 'package:desktopcatchmehigher/patternRecognition.dart';
import 'package:desktopcatchmehigher/patternThree.dart';
import 'package:desktopcatchmehigher/patternTwo.dart';
import 'package:desktopcatchmehigher/selectionThree.dart';
import 'package:desktopcatchmehigher/selectionTwo.dart';
import 'package:desktopcatchmehigher/welcomepage.dart';
import 'package:desktopcatchmehigher/existingprofile.dart';
import 'package:desktopcatchmehigher/newprofile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  initializeDefault();
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
      'countThree': (context) => CountThreeActivity(),
      'countFour': (context) => CountFourActivity(),
      'patternRecognition': (context) => PatternRecognition(),
      'patternTwo': (context) => PatternTwoActivity(),
      'patternThree': (context) => PatternThreeActivityPage(),
      'patternFour': (context) => PatternFourPage(),
      'admin': (context) => AdminMonitorPage(),
    },
  ));
}

initializeDefault() async {           //initializing the Firebase to the main file 
  try {
    WidgetsFlutterBinding.ensureInitialized();
    FirebaseApp app = await Firebase.initializeApp();
    print('Initialized default app $app');
  } catch (ex) {
    print('Re-check building the connection through Firebase');
  }
}
