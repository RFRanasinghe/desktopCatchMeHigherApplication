import 'package:flutter/material.dart';

class AdminMonitorPage extends StatefulWidget {
  const AdminMonitorPage({Key? key}) : super(key: key);

  @override
  _AdminMonitorPageState createState() => _AdminMonitorPageState();
}

class _AdminMonitorPageState extends State<AdminMonitorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Welcome to Admins' Monitor Page"),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Show student results"),),
        ),
      ),
    );
  }
}
