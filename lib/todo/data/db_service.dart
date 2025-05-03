
import 'dart:developer';

import 'package:flutter_s1/todo/data/task_model.dart';
import 'package:sqflite/sqflite.dart';

class DbService {
 static late final Database myDb ;

 static String tableName = 'Tasks';
 static String titleCol = 'title';
 static String descCol = 'desc';
 static String dateCol = 'date';
 static String statusCol = 'status';


static initializeDB() async{
  myDb = await openDatabase('tasks.db', version: 1,
    onCreate: (db, version) async {
      // call first time the db created
      // creat tables
       await db.execute('CREATE TABLE $tableName (id INTEGER PRIMARY KEY, $titleCol TEXT, $descCol TEXT, $dateCol TEXT, $statusCol TEXT)');
    },
    onOpen: (db) {
      // retreive all data
    },
  );
 }

// insert new task 

static Future<void> insertTask(TaskModel task)async{
  log('insert task called');
  int id = await myDb.rawInsert( 'INSERT INTO $tableName($titleCol, $descCol, $dateCol, $statusCol) VALUES("${task.title}","${task.desc}","${task.date}", "${task.status?.name}")');
log('Row number $id added successfully');
log('insert task ended');
}
// read all tasks

static Future<List<TaskModel>> fetchTodoTasks() async {
  List<TaskModel> tasks = [];

  var tasksRawData = await myDb.rawQuery('SELECT * FROM $tableName WHERE $statusCol = "${TaskStatus.todo.name}"');

  for(var taskMap in tasksRawData){
    var model = TaskModel.fromJson(taskMap);
    tasks.add(model);
  }

  log(tasksRawData.toString());
  return tasks;
}
static Future<List<TaskModel>> fetchArchivedTasks() async {
  List<TaskModel> tasks = [];

  var tasksRawData = await myDb.rawQuery('SELECT * FROM $tableName WHERE $statusCol = "${TaskStatus.archived.name}"');

  for(var taskMap in tasksRawData){
    var model = TaskModel.fromJson(taskMap);
    tasks.add(model);
  }

  log(tasksRawData.toString());
  return tasks;
}
static Future<List<TaskModel>> fetchDoneTasks() async {
  List<TaskModel> tasks = [];

  var tasksRawData = await myDb.rawQuery('SELECT * FROM $tableName WHERE $statusCol = "${TaskStatus.done.name}"');

  for(var taskMap in tasksRawData){
    var model = TaskModel.fromJson(taskMap);
    tasks.add(model);
  }

  log(tasksRawData.toString());
  return tasks;
}
// delete task 

static Future<void> deleteTask(TaskModel task)async{
 var affectedRows = await myDb.rawDelete('DELETE FROM $tableName WHERE id = ${task.id}');
 log('Number of affected rows after delete $affectedRows');
}

// edit task

static Future<void> archiveTask(TaskModel task)async{
  await myDb.rawUpdate('UPDATE $tableName SET $statusCol = "${TaskStatus.archived.name}" WHERE id = ${task.id}');
}

static Future<void> doneTask(TaskModel task)async{
 await myDb.rawUpdate('UPDATE $tableName SET $statusCol = "${TaskStatus.done.name}" WHERE id = ${task.id}');
}

}