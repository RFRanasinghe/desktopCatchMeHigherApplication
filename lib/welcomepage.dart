import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Welcome Page"),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/papertool.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 180.0, left: 80, right: 80),
                    child: SizedBox(
                      width: 400,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, 'newprofile');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        icon: Icon(Icons.app_registration_sharp),
                        label: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Create Profile",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 180.0, left: 80, right: 80),
                    child: SizedBox(
                      width: 400,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, 'userlogin');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        icon: Icon(Icons.login),
                        label: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Existing Profile",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 160.0, left: 200, right: 200.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 300,
                      height: 80,
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.local_activity_sharp),
                        onPressed: () {
                          Navigator.pushNamed(context, 'admin');
                        },
                        label: Text(
                          "Admin",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
