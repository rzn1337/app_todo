import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../service/auth_service.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';
import 'signup_screen.dart';
import 'package:flutter/cupertino.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  AuthClass authClass = AuthClass();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> toDoList = [
    {"task": "Make Tutorial", "completed": false},
    {"task": "Do Exercise", "completed": false},
  ];

 void checkBoxChanged(bool? value, int index) async {
  final DocumentSnapshot documentSnapshot = await _firestore
      .collection("users/${FirebaseAuth.instance.currentUser!.uid}/todos")
      .doc(toDoList[index]["documentId"])
      .get();
  final bool completed = documentSnapshot["completed"];
  await _firestore
      .collection("users/${FirebaseAuth.instance.currentUser!.uid}/todos")
      .doc(toDoList[index]["documentId"])
      .update({"completed": !completed});
  setState(() {
    toDoList[index]["completed"] = !completed;
  });
  print("toDoList: $toDoList");
  print("documentSnapshot.id: ${documentSnapshot.id}");
}





  void saveNewTask() async {
  final String newTask = _controller.text.trim();
  if (newTask.isNotEmpty) {
    final DocumentReference newTaskRef = await _firestore.collection('users/${FirebaseAuth.instance.currentUser!.uid}/todos').add({
      'task': newTask,
      'completed': false,
    });
    setState(() {
      toDoList.add({'task': newTask, 'completed': false, 'documentId': newTaskRef.id});
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
}




  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

 void _deleteTask(BuildContext context, String documentId) async {
  setState(() {
    toDoList.removeWhere((task) => task["documentId"] == documentId);
  });
  await _firestore.collection('users/${FirebaseAuth.instance.currentUser!.uid}/todos').doc(documentId).delete();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
      decoration: const BoxDecoration(
        color: Colors.black, 
        
      ),
    ),
        actions: [
        IconButton(icon: Icon(CupertinoIcons.chevron_forward), onPressed: () async {
          await authClass.logout();
          Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(builder: (builder) => SignUpPage()), 
        (route) => false);
        },
        color: Colors.amber,
        ),
      ],
        backgroundColor: Colors.amber,
        centerTitle: false,
        title: Text(
          'Tasks:',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'SF',
            color: Colors.amber,
            letterSpacing: 1,
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
  backgroundColor: Colors.amber,
  foregroundColor: Colors.black,
  onPressed: createNewTask,
  icon: Icon(Icons.add),
  label: Text('ADD'),
  extendedTextStyle: TextStyle(
    fontFamily: 'SF',
    letterSpacing: 2,
    fontSize: 13
  ),
),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('users/${FirebaseAuth.instance.currentUser!.uid}/todos').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          toDoList.clear();
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          for (final DocumentSnapshot document in documents) {
            final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            data['documentId'] = document.id;
            toDoList.add(data);
          }
          return ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: toDoList[index]['task'] as String,
                taskCompleted: toDoList[index]['completed'] as bool? ?? false,
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => _deleteTask(context, toDoList[index]['documentId'])
              );
            },
          );
        },
      ),
    );
  }
}