import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'logged_in_user_model.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({Key? key}) : super(key: key);

  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  // User? _loggedInUser;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = "";

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _errorMessage = "";
    });

    final form = _formKey.currentState;
    if (form!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      try {
        var user;
        try {
          final userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          user = userCredential.user;
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Invalid email or password")));
          print(e.toString());
        }
        final uid = user!.uid;
        if (user != "") {
          var loggedInUserModel =
              Provider.of<LoggedInUserModel>(context, listen: false);
          loggedInUserModel.setLoggedInUser(
            AppUser(
              email: email,
              uid: uid,
            ),
            email: email,
            uid: uid,
          );
        } else {
          throw 'User is null';
        }

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Log in successful"),
        ));

        Navigator.pushNamed(context, 'activityHome');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Log in failed"),
        ));
        print(e.toString());
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
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your Email";
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
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
      ),
    );
  }
}
