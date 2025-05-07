import 'package:flutter/material.dart';
import 'package:flutter_s1/todo/data/db_service.dart';
import 'package:flutter_s1/todo/data/task_model.dart';

class TasksProvider extends ChangeNotifier{
  // data 
  List<TaskModel> tasks = []; 


  // add Task 

  void addTask(TaskModel task)async{
   await DbService.instance.insertTask(task);
   tasks =  await DbService.instance.fetchAllTasks();
   notifyListeners();
  }

  // delete Task

  // mark as done 

  // mark as archived 

  // fetch tasks

}