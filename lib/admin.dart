import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminMonitorPage extends StatefulWidget {
  const AdminMonitorPage({Key? key}) : super(key: key);

  @override
  _AdminMonitorPageState createState() => _AdminMonitorPageState();
}

class _AdminMonitorPageState extends State<AdminMonitorPage> {
  List<Map> _users = [];

  String nameFilter = '';
  TextEditingController nameController = TextEditingController();
  String idnumberFilter = '';
  TextEditingController idnumberController = TextEditingController();
  String nameErrorMessage = '';
  String idNumberErrorMessage = '';
  String userNotFoundMessage = '';

  List<Map<dynamic, dynamic>> filteredUsers = [];

  @override
  void initState() {
    getUsersFromFirestore();
    super.initState();
  }

  Future<void> getUsersFromFirestore() async {
    try {
      final docRef = FirebaseFirestore.instance.collection('students').get();

      final snapshot = await docRef;

      final users = snapshot.docs.map((doc) => doc.data()).toList();

      setState(() {
        _users = users;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> filterUsersByName() async {
    nameFilter = nameController.text.toLowerCase();
    idnumberFilter = idnumberController.text.toLowerCase();

    if (nameFilter == '' && idnumberFilter == '') {
      return;
    }

    if (_users.isEmpty) {
      return;
    }

    try {
      filteredUsers = _users
          .where((user) =>
              user['name'].toString().toLowerCase().contains(nameFilter) &&
              user['idnumber']
                  .toString()
                  .toLowerCase()
                  .contains(idnumberFilter))
          .toList()
          .sublist(0, 1);
    } catch (e) {
      print("No user found");
      setState(() {
        userNotFoundMessage = "No user found";
      });
    }

    if (filteredUsers.isEmpty) {
      return;
    }

    filteredUsers[0]['scores'] = await FirebaseFirestore.instance
        .collection('scores')
        .where('uid', isEqualTo: filteredUsers[0]['uid'])
        .get()
        .then((value) => value.docs.map((doc) => doc.data()).toList());

    print(filteredUsers);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Welcome to Admins' Monitor Page"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          errorText: nameErrorMessage.isNotEmpty
                              ? nameErrorMessage
                              : null,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: idnumberController,
                        decoration: InputDecoration(
                          labelText: 'Id Number',
                          errorText: idNumberErrorMessage.isNotEmpty
                              ? idNumberErrorMessage
                              : null,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          nameErrorMessage = nameController.text.isEmpty
                              ? 'Required field'
                              : "";
                          idNumberErrorMessage = idnumberController.text.isEmpty
                              ? 'Required field'
                              : "";
                        });

                        if (nameController.text.isNotEmpty &&
                            idnumberController.text.isNotEmpty) {
                          filterUsersByName();
                        }
                      },
                      icon: Icon(Icons.search),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                Text(
                  userNotFoundMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          Expanded(child: Text('User details will be displayed below')),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                return DataTable(
                  columnSpacing: 20.0,
                  columns: [
                    DataColumn(label: Text('Title')),
                    DataColumn(label: Text('Value')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Name')),
                      DataCell(Text(filteredUsers[index]['name'])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Email')),
                      DataCell(Text(filteredUsers[index]['email'])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('ID Number')),
                      DataCell(Text(filteredUsers[index]['idnumber'])),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Condition')),
                      DataCell(Text(filteredUsers[index]['condition'])),
                    ]),
                  ],
                );
              },
            ),
          ),
          Expanded(child: Text('Scores will be displayed below')),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                List<Map<String, dynamic>> scores =
                    filteredUsers[index]['scores'];
                int scoresLength = scores.length;
                return DataTable(
                  columnSpacing: 20.0,
                  columns: [
                    DataColumn(label: Text('Date')),
                    DataColumn(label: Text('Couting Number Marks')),
                    DataColumn(label: Text('Color Selection Marks')),
                    DataColumn(label: Text('Pattern Recognition Marks')),
                    DataColumn(label: Text('Color Filling Marks')),
                  ],
                  rows: List<DataRow>.generate(scoresLength, (rowIndex) {
                    return DataRow(cells: [
                      DataCell(Text(scores[rowIndex]['date'] ?? 'N/A')),
                      DataCell(Text(scores[rowIndex]['countingNumberMarks'] !=
                              null
                          ? scores[rowIndex]['countingNumberMarks'].toString()
                          : 'N/A')),
                      DataCell(Text(scores[rowIndex]['colorSelectionMarks'] !=
                              null
                          ? scores[rowIndex]['colorSelectionMarks'].toString()
                          : 'N/A')),
                      DataCell(Text(
                          scores[rowIndex]['patternRecognitionMarks'] != null
                              ? scores[rowIndex]['patternRecognitionMarks']
                                  .toString()
                              : 'N/A')),
                      DataCell(Text(
                          scores[rowIndex]['colorFillingMarks'] != null
                              ? scores[rowIndex]['colorFillingMarks'].toString()
                              : 'N/A')),
                    ]);
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
