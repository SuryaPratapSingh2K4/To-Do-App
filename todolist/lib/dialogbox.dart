import 'package:flutter/material.dart';
import 'package:todolist/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  //VoidCallback progress;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    //required this.progress
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 185,
        width: 400,
        child: Column(
          children: [
            Text(
              'Add To-Do',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new to do item'),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: onSave, child: Text('SAVE')),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: onCancel,
                  child: Text('CANCEL'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
