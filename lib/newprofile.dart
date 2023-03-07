import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewProfile extends StatefulWidget {
  const NewProfile({Key? key}) : super(key: key);

  @override
  _NewProfileState createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  final _formKey = GlobalKey<FormState>();

  //String _name;
  //String _email;
  //String _idNumber;
  //String _stateOfCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("New Profile"),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/rainbow.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Id number',
                    ),
                    validator: (value) {
                      if (value == '') {
                        return 'Please enter your id number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      //_name = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == '') {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                    ),
                    validator: (value) {
                      if (value == '') {
                        return 'Please enter your email Address';
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Students' state of category",
                    ),
                    validator: (value) {
                      if (value == '') {
                        return 'Please enter the current state of the student';
                      }
                      return null;
                    },
                    onSaved: (value) {},
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        //if (_formKey.currentState.validate()) {
                        //_formKey.currentState.save();
                        ///// TODO: submit form data
                        //}
                      },
                      child: Text("Submit"),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'activityHome');
                    },
                    child: Text("Activity Home"),
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
