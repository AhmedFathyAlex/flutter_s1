import 'package:sqflite/sqflite.dart';

class DbService {
 static late final Database myDb;

static initializeDB() async{
  myDb = await openDatabase('tasks.db', version: 1,
    onCreate: (db, version) {
      // call first time the db created
      // creat tables
      print('Database Created');
    },
    onOpen: (db) {
       print('Database Opened');
    },
  );
 }

 
}