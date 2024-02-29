import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/theme_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static Icon themeIcon = const Icon(Icons.nightlight);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Making Database class object
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    super.initState();
    // If this is the first time ever opening the app, then create the default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // There exists a data
      db.loadData();
    }
  }

  // Reference Hive Box
  final _myBox = Hive.box('myBox');
  // Text Controller
  final _controller = TextEditingController();
  // To Do List tasks
  // List todolist = [
  //   // ["Wake Up", false],
  //   // ["Take A Bath", false],
  //   // ["Start Working", false],
  // ];
  // Change Check Box On Tap
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // Save New Task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateDataBase();
    Navigator.of(context).pop();
  }

  // Create New Task
  void createNewTask() {
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
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        backgroundColor: context.theme.colorScheme.primary,
        foregroundColor: context.theme.colorScheme.onPrimary,
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "To Do",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            GestureDetector(
              onTap: (){
                Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
              },
              child: HomePage.themeIcon,
            ),
          ],
        ),
        elevation: 1,
        foregroundColor: context.theme.colorScheme.onPrimary,
        backgroundColor: context.theme.colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            deleteFunction: (context) => deleteTask(index),
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxTapped(value, index),
          );
        },
      ),
    );
  }
}
