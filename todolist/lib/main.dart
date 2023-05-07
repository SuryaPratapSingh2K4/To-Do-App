import 'package:flutter/material.dart';
import 'package:todolist/Homepage.dart';
import 'package:todolist/todoitem.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      title: 'TO DO LIST',
      home: Homepage(
        // onSave: saveNewTask,
        // onCancel: () => Navigator.of(context).pop(),
      ),
    );
  }

  // void saveNewTask() {
  //   setState(() => toDoList.add)
  // }
}

// void setState(Null Function() param0) {
// }
