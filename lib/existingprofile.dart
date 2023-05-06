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

  Future<QuerySnapshot> getData() async {
    final userCollection = FirebaseFirestore.instance.collection("students");
    final querySnapshot = await userCollection.get();
    return querySnapshot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Existing Profile"),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final dynamic item = data[index].data();
              return ListTile(
                title: Text(item?['name']),
                subtitle: Text(item?['condition']),
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.local_activity_rounded,
                      color: Color.fromARGB(255, 1, 41, 75)),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.fact_check_sharp, color: Colors.red),
                  onPressed: () {},
                ),
              );
            },
          );
        },
      ),
    );
  }
}
