import 'dart:async';

import 'package:flutter/material.dart';

import 'package:todolist/dialogbox.dart';
import 'package:todolist/todoitem.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _controller = TextEditingController();


  bool loading = false;

  List toDoList = [
    ["TO DO ITEM 1", false],
    ["TO DO ITEM 2", true],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
      loading = true;
      value = value + 0.25;
      //updateProgress();
    });

    Navigator.of(context).pop();
  }



  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: (() => Navigator.of(context).pop()),
          );
        });
  }

   void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
      value = value - 0.25;
    });
   }

  double value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: const Text('TO DO APP'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Row(
              children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: CircleAvatar(
                    maxRadius: 40,
                    backgroundImage: AssetImage('assets/images/Phomto.jpg'),
                                 ),
                 ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Surya Pratap Singh",
                      style: TextStyle(fontSize: 20),
                    ),
                     SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text("Experience lvl",style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 4),
                        Text("$value")
                      ],
                    )
                   
                   
                    
                  
                   
                  ],
                ),
           
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 185),
              child: Text(
                "TO DO ITEMS",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: toDoList.length,
                itemBuilder: (context, index) {
                  return ToDoItem(
                    taskName: toDoList[index][0],
                    taskCompleted: toDoList[index][1],
                    onChanged: (value) => checkBoxChanged(value, index),
                    deleteFunction: (context) => deleteTask(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  


  // void onSave() {}

  // void onCancel() {}

  // void deleteTask(int index) {
  //   setState(() {
  //     toDoList.removeAt(index);
  //   });
  // }
}



// void  Indicator() {
//   setstat
// }
