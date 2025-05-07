import 'package:flutter/material.dart';
import 'package:flutter_s1/todo/data/db_service.dart';
import 'package:flutter_s1/todo/data/task_model.dart';

class TasksProvider extends ChangeNotifier{
  // data 
  List<TaskModel> tasks = []; 
  // add Task 
  void addTask(TaskModel task)async{
   await DbService.instance.insertTask(task);
   fetchTasks();
  }

  // delete Task
 void deleteTask(TaskModel task)async{
   await DbService.instance.deleteTask(task);
   fetchTasks();
  }

  // mark as done 

   void markAsDone(TaskModel task)async{
   await DbService.instance.doneTask(task);
   fetchTasks();
  }
  // mark as archived 
void markAsArchive(TaskModel task)async{
   await DbService.instance.archiveTask(task);
   fetchTasks();
  }
  // fetch tasks
  void fetchTasks()async{
   tasks =  await DbService.instance.fetchAllTasks();
   notifyListeners();
  }

}