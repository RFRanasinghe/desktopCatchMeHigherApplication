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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(160.0),
                    child: SizedBox(
                      width: 400,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'newprofile');
                        },
                        child: Padding(
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
                    padding: const EdgeInsets.all(160.0),
                    child: SizedBox(
                      width: 400,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'userlogin');
                        },
                        child: Padding(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton.icon(
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
                ],
              ),
            ],
          ),
          // child: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.all(160.0),
          //       child: SizedBox(
          //         width: 400,
          //         child: new ElevatedButton(
          //           child: Padding(
          //             padding: const EdgeInsets.all(20.0),
          //             child: new Text(
          //               "Create Profile",
          //               style: TextStyle(
          //                 fontSize: 30,
          //               ),
          //             ),
          //           ),
          //           onPressed: () {
          //             Navigator.pushNamed(context, 'newprofile');
          //           },
          //           style: ElevatedButton.styleFrom(
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(15.0),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(160.0),
          //       child: SizedBox(
          //         width: 400,
          //         child: new ElevatedButton(
          //           child: Padding(
          //             padding: const EdgeInsets.all(20.0),
          //             child: new Text(
          //               "Existing Profile",
          //               style: TextStyle(fontSize: 30),
          //             ),
          //           ),
          //           onPressed: () {
          //             Navigator.pushNamed(context, 'existingprofile');
          //           },
          //           style: ElevatedButton.styleFrom(
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(20.0),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(top: 200.0, left: 180),
          //       child: new ElevatedButton(
          //         child: Padding(
          //           padding: const EdgeInsets.all(20.0),
          //           child: new Text(
          //             "Admin",
          //             style: TextStyle(fontSize: 30),
          //           ),
          //         ),
          //         onPressed: () {},
          //         style: ElevatedButton.styleFrom(
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(20.0),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
