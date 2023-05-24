import 'package:desktopcatchmehigher/logged_in_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'logged_in_user_model.dart';

class ActivityHomePage extends StatefulWidget {
  const ActivityHomePage({Key? key}) : super(key: key);

  @override
  _ActivityHomePageState createState() => _ActivityHomePageState();
}

class _ActivityHomePageState extends State<ActivityHomePage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> logout() async {
    await _auth.signOut();

    if (_auth.currentUser == null) {
      final loggedInUserModel =
          Provider.of<LoggedInUserModel>(context, listen: false);
      loggedInUserModel.setLoggedInUser(
        AppUser(
          email: "",
          uid: "",
        ),
        email: "",
        uid: "",
      );
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("You have logged out"),
      ),
    );

    Navigator.of(context).pushNamedAndRemoveUntil(
      'userlogin',
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final loggedInUserModel = Provider.of<LoggedInUserModel>(context);

    if (loggedInUserModel.loggedInUser == null ||
        loggedInUserModel.loggedInUser!.email!.isEmpty ||
        loggedInUserModel.loggedInUser!.uid!.isEmpty) {
      if (_navigatorKey.currentState!.canPop()) {
        _navigatorKey.currentState!.pop();
        Navigator.pushNamed(context, 'userlogin');
      } else {
        Navigator.pushNamed(context, 'userlogin');
      }
      return Container();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Activity House"),
          ),
        ),
        body: Center(
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/papertool.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: SizedBox(
                      width: 400,
                      child: new ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: new Text(
                            "Color Selection",
                            style: TextStyle(
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'colorSelection');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: SizedBox(
                      width: 400,
                      child: new ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: new Text(
                            "Color Filling",
                            style: TextStyle(
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'colorFilling');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SizedBox(
                      width: 400,
                      child: new ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: new Text(
                            "Counting Numbers",
                            style: TextStyle(
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'countingNum');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SizedBox(
                      width: 400,
                      child: new ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: new Text(
                            "Pattern Recognition",
                            style: TextStyle(
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, 'patternRecognition');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1400.0),
                    child: ElevatedButton(
                      onPressed: () {
                        logout();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Consumer<LoggedInUserModel>(
                      builder: (context, loggedInUserModel, _) {
                    return Text(
                      loggedInUserModel.loggedInUser!.email! +
                          " " +
                          loggedInUserModel.loggedInUser!.uid!,
                      style: TextStyle(
                        backgroundColor: Colors.white,
                      ),
                    );
                  })
                ],
              )),
        ),
      );
    }
  }
}
