import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewProfile extends StatefulWidget {
  const NewProfile({Key? key}) : super(key: key);

  @override
  _NewProfileState createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("New Profile"),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/tree.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Enter your email address',
                    labelText: 'Email address',
                  ),
                ),
                new Container(
                  child: new ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: null,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
