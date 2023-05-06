import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:image_picker_web_redux/image_picker_web_redux.dart';

class ExistingProfile extends StatefulWidget {
  const ExistingProfile({Key? key}) : super(key: key);

  @override
  _ExistingProfileState createState() => _ExistingProfileState();
}

class _ExistingProfileState extends State<ExistingProfile> {
  final _formKey = GlobalKey<FormState>();

  // Future<QuerySnapshot> getData() async {
  //   final userCollection = FirebaseFirestore.instance.collection('students');
  //   final querySnapshot = await userCollection.get();
  //   return querySnapshot;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Existing Profile"),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('students').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              var item = snapshot.data?.docs[index].data();
              return Row(
                children: [
                  ListTile(
                    title: Text(item!['name'] ?? ''),
                    subtitle: Text(item['condition'] ?? ''),
                    // trailing: ElevatedButton(
                    //   onPressed: () {},
                    //   child: Text("Activity Home"),
                    // ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
