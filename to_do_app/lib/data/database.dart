import 'package:hive/hive.dart';

class ToDoDatabase{
  List toDoList = [];
  // Reference the box
  final _myBox = Hive.box('myBox');

  // When launching app for first time ever
  void createInitialData(){
    toDoList = [
      ["Wake Up",false],
      ["Do Exercise",false],
    ];
  }

  // Load the data from database
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  // Update the database
  void updateDataBase(){
    _myBox.put("TODOLIST", toDoList);
  }
}