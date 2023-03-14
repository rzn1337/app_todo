import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[300], 
      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
      content: Container(
        height: 109,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20), 
                  borderSide: BorderSide(
                  width: 1.5,
                  color: Colors.black,
                ),
          ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
          width: 1, color: Colors.black), 
                borderRadius: BorderRadius.circular(30)
              ),
              hintText: "Add a new task",
              hintStyle: TextStyle(
                fontFamily: 'SF',
              )
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(text: "Save", onPressed: onSave),
              SizedBox(
                width: 9,
              ),
              MyButton(text: "Cancel", onPressed: onCancel),
            ],
          )
        ],
        ),
      ),
    );
  }
}