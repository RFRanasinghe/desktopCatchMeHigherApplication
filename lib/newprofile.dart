import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:desktopcatchmehigher/widget/dropzoneWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:image_picker_windows/image_picker_windows.dart';
import 'package:permission_handler/permission_handler.dart';

//import 'dart:html';

class NewProfile extends StatefulWidget {
  const NewProfile({Key? key}) : super(key: key);

  @override
  _NewProfileState createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  //final databaseReference = FirebaseDatabase.instance.reference();
  final _formKey = GlobalKey<FormState>();

  bool isButtonActive = true;
  late DropzoneViewController controller;
  final Set<XFile> files = {};

  //DatabaseReference ref = FirebaseDatabase.instance.ref("students");

  TextEditingController _idNumberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _conditionTypeController = TextEditingController();

  @override
  void dispose() {
    _idNumberController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _conditionTypeController.dispose();
    super.dispose();
  }

  // Widget buildFile(XFile file) {
  //   final isJPG = file.path.endsWith('jpg');
  //   final isPNG = file.path.endsWith('png');
  //   final isJPEG = file.path.endsWith('jpeg');

  //   if (isJPG) {
  //     return Image.file(
  //       File(file.path),
  //       width: 50,
  //       height: 50,
  //       fit: BoxFit.cover,
  //     );
  //   }
  //   if (isPNG) {
  //     return Image.file(
  //       File(file.path),
  //       width: 50,
  //       height: 50,
  //       fit: BoxFit.cover,
  //     );
  //   }
  //   if (isJPEG) {
  //     return Image.file(
  //       File(file.path),
  //       width: 50,
  //       height: 50,
  //       fit: BoxFit.cover,
  //     );
  //   } else {
  //     return Text("No Preview");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final buttonColor = Colors.green.shade300;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "New Profile",
          ),
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
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _idNumberController,
                      decoration: InputDecoration(
                        labelText: 'Id number',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onSaved: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter your email Address';
                        }
                        return null;
                      },
                      onSaved: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _conditionTypeController,
                      decoration: InputDecoration(
                        labelText: "Students' state of category",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter the current state of the student';
                        }
                        return null;
                      },
                      onSaved: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Upload Image of the Student"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        DropTarget(
                          onDragDone: (urls) {
                            setState(() =>
                                {files.clear(), files.add(urls.files.last)});
                          },
                          child: Container(
                            color: Colors.green,
                            height: 100.0,
                            child: Center(
                              child: Text(
                                "Drag & drop your image",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //children: files.map(buildFile).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 150.0, top: 10.0),
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: isButtonActive
                                ? () {
                                    if (_formKey.currentState!.validate()) {
                                      createData();
                                    }
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            label: Text(
                              "Submit",
                              style: TextStyle(fontSize: 30),
                            ),
                            icon: Icon(Icons.send_sharp),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1000.0, top: 10.0),
                        child: SizedBox(
                          width: 300,
                          height: 60,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, 'activityHome');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            label: Text(
                              "Activity Home",
                              style: TextStyle(fontSize: 30),
                            ),
                            icon: Icon(Icons.keyboard_option_key_sharp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // uploadFile(txtName, txtEmail, txtid_number, txtcondition_type) async {
  //   // upload file to firebase storage
  //   //create reference to the firebase storage bucket
  //   final FirebaseStorage storage = FirebaseStorage.instance;
  //   final Reference storageReference =
  //       storage.ref().child('profile_pictures_of_dss');

  //   if (files.isNotEmpty) {
  //     final imageXFile = files.last;
  //     //upload file
  //     final file = File(imageXFile.path);
  //     final TaskSnapshot taskSnapshot = await storageReference.putFile(file);

  //     final imageURL =
  //         await taskSnapshot.ref.getDownloadURL(); //get download url

  //     DatabaseReference reference =
  //         FirebaseDatabase.instance.reference().child('students');

  //     reference
  //         .push()
  //         .set({
  //           'name': txtName,
  //           'email': txtEmail,
  //           'id_number': txtid_number,
  //           'condition_type': txtcondition_type,
  //           'imageURL': imageURL
  //         })
  //         .then((value) => {
  //               //data successfully submitted
  //               print('Data stored successfully')
  //             })
  //         .catchError((error) {
  //           //handle error
  //           print('Data did not get saved successfully');
  //         });
  //   } else {}
  // }

  Future createData() async {
    final userCollection = FirebaseFirestore.instance.collection("students");

    final docRef =
        userCollection.doc(); //firebase will run random ids for each document

    await docRef.set({
      "idnumber": _idNumberController.text,
      "name": _nameController.text,
      "email": _emailController.text,
      "condition": _conditionTypeController.text
    });
  }
}
