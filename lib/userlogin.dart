import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _idNumberController = TextEditingController();
  String _errorMessage = "";

  @override
  void dispose() {
    _idNumberController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _errorMessage = "";
    });

    final form = _formKey.currentState;
    if (form!.validate()) {
      final id = _idNumberController.text.trim();
      final name = _nameController.text.trim();

      final userCollection = FirebaseFirestore.instance.collection("students");
      final querySnapshot = await userCollection
          .where("idnumber", isEqualTo: id)
          .where("name", isEqualTo: name)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Navigator.pushNamed(context, 'activityHome');
      } else {
        setState(() {
          _errorMessage = "Invalid credentials";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Log In Page"),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (_errorMessage.isNotEmpty)
                    Text(
                      _errorMessage,
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                      controller: _idNumberController,
                      decoration: InputDecoration(
                        labelText: "Id number",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your ID";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        }
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text("Log In"),
                  ),
                ],
              ),
            ),
          ),
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     TextField(
        //       controller: _nameController,
        //       decoration: InputDecoration(
        //         labelText: "Name",
        //       ),
        //     ),
        //     SizedBox(
        //       height: 20,
        //     ),
        //     TextField(
        //       controller: _idNumberController,
        //       decoration: InputDecoration(
        //         labelText: "ID number",
        //       ),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {},
        //       child: Text("LogIn"),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
