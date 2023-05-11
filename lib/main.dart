import 'dart:io';
import 'dart:js';

import 'package:desktopcatchmehigher/activityHome.dart';
import 'package:desktopcatchmehigher/admin.dart';
import 'package:desktopcatchmehigher/colorFilling.dart';
import 'package:desktopcatchmehigher/colorSelection.dart';
import 'package:desktopcatchmehigher/countFour.dart';
import 'package:desktopcatchmehigher/countThree.dart';
import 'package:desktopcatchmehigher/countTwo.dart';
import 'package:desktopcatchmehigher/countingNum.dart';
import 'package:desktopcatchmehigher/fillingTwo.dart';
import 'package:desktopcatchmehigher/patternFour.dart';
import 'package:desktopcatchmehigher/patternRecognition.dart';
import 'package:desktopcatchmehigher/patternThree.dart';
import 'package:desktopcatchmehigher/patternTwo.dart';
import 'package:desktopcatchmehigher/selectionThree.dart';
import 'package:desktopcatchmehigher/selectionTwo.dart';
import 'package:desktopcatchmehigher/userlogin.dart';
import 'package:desktopcatchmehigher/welcomepage.dart';
import 'package:desktopcatchmehigher/existingprofile.dart';
import 'package:desktopcatchmehigher/newprofile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'logged_in_user_model.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCay4lrEX25x0CYb55_X83BD5Djb3HQCCU",
            authDomain: "webappfordds.firebaseapp.com",
            projectId: "webappfordds",
            storageBucket: "webappfordds.appspot.com",
            messagingSenderId: "1088750822310",
            appId: "1:1088750822310:web:c052bf5a557b066d696567"));
  } else {
    await Firebase.initializeApp();
  }

  await Firebase.initializeApp();

  ///initializeDefault();
  runApp(ChangeNotifierProvider<LoggedInUserModel>(
      create: (context) => LoggedInUserModel(),
      child: MaterialApp(
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
          'fillingTwo': (context) => ColorFillingSecondPage(),
          'userlogin': (context) => UserLoginPage(),
        },
      )));
}
