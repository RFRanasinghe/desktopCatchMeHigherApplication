import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//import 'package:image_picker_web/image_picker_web.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:image_picker_web_redux/image_picker_web_redux.dart';
import 'dart:async';
import 'dart:html';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';

class NewProfile extends StatefulWidget {
  const NewProfile({Key? key}) : super(key: key);

  @override
  _NewProfileState createState() => _NewProfileState();
}

class _NewProfileState extends State<NewProfile> {
  final _formKey = GlobalKey<FormState>();

  bool isButtonActive = true;

  TextEditingController _idNumberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _conditionTypeController = TextEditingController();

  late String _imageDownloadUrl;
  late Uint8List _imageBytes;
  // final storage =
  //     FirebaseStorage.instanceFor(bucket: "gs://webappfordds.appspot.com");

  @override
  void dispose() {
    _idNumberController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _conditionTypeController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePickerWeb.getImage(outputType: ImageType.bytes);
    if (pickedImage != null) {
      setState(() {
        _imageBytes = pickedImage;
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageBytes == null) {
      return;
    }

    final storageRef = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('student_images')
        .child(DateTime.now().toIso8601String());

    final uploadTask = storageRef.putData(_imageBytes);
    final snapshot = await uploadTask.whenComplete(() => null);
    final downloadUrl = await snapshot.ref.getDownloadURL();

    setState(() {
      _imageDownloadUrl = downloadUrl;
    });
  }

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
                      onSaved: (value) {},
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
                        Container(
                          //color: Colors.green,
                          height: 140.0,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Select your image",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: _pickImage,
                                        child: Text("Pick Image"),
                                      ),
                                      // ElevatedButton(
                                      //   onPressed: () async {
                                      //     var picked = await FilePicker.platform
                                      //         .pickFiles();
                                      //     if (picked != null) {
                                      //       print(picked.files.first.name);
                                      //     } else {
                                      //       print(
                                      //           "Image upload did not support");
                                      //     }
                                      //   },
                                      //   child: Text("Upload image"),
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //),
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

  Future createData() async {
    await _uploadImage();

    final userCollection = FirebaseFirestore.instance.collection("students");

    final docRef =
        userCollection.doc(); //firebase will run random ids for each document

    await docRef.set({
      "idnumber": _idNumberController.text,
      "name": _nameController.text,
      "email": _emailController.text,
      "condition": _conditionTypeController.text,
      "image_url": _imageDownloadUrl
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Student data saved successfully"),
    ));
  }
}
