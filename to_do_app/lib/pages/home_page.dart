import 'package:flutter/material.dart';
import 'package:to_do_app/util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Text Controller
  final _controller = TextEditingController();
  // To Do List tasks
  List todolist = [
    ["Wake Up", false],
    ["Take A Bath", false],
    ["Start Working", false],
  ];
  // Change Check Box On Tap
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }
  // Save New Task
  void saveNewTask(){
    setState(() {
      todolist.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
  // Create New Task
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          myController: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
  // Delete Task
  void deleteTask(int index){
    setState(() {
      todolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        backgroundColor: Colors.teal[900],
        foregroundColor: Colors.white,
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text(
            "TO DO",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        elevation: 1,
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal[900],
      ),
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            deleteFunction: (context) => deleteTask(index),
            taskName: todolist[index][0],
            taskCompleted: todolist[index][1],
            onChanged: (value) => checkBoxTapped(value, index),
          );
        },
      ),
    );
  }
}
