import 'dart:js';

import 'package:desktopcatchmehigher/welcomepage.dart';
import 'package:desktopcatchmehigher/existingprofile.dart';
import 'package:desktopcatchmehigher/newprofile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Catch Me Higher with Down Syndrome",
    initialRoute: 'welcomepage',
    routes: {
      'welcomepage': (context) => WelcomePage(),
      'newprofile': (context) => NewProfile(),
      'existingprofile': (context) => ExistingProfile(),
    },
  ));
}
