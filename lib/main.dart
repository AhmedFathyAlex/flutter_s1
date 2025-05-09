import 'package:flutter/material.dart';
import 'package:flutter_s1/counter/counter_provider.dart';
import 'package:flutter_s1/todo/data/db_service.dart';
import 'package:flutter_s1/todo/ui/screens/main_tasks.dart';
import 'package:flutter_s1/todo/ui/tasks_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async{
  
   WidgetsFlutterBinding.ensureInitialized();
  var sp = await SharedPreferences.getInstance();

   await DbService.instance.initializeDB();

  var isLoggedIn = sp.getBool('isLoggedIn') ?? false; 
  runApp( MainApp(isLoggedIn: isLoggedIn,));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.isLoggedIn});
 final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksProvider()..fetchTasks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainTasks()
      ),
    );
  }
}

// Material App (root widget) [home - debugShowCheckedModeBanner]
// Scaffold [appBar - body - floatingActionButton - actions]
// AppBar [backgroundColor - title - actions - leading]
// Text [data - style]
// TextStyle [fontSize - color - fontWeight]
// Center [child]
// Column [children - mainAxisAlignment]
// Row [children - mainAxisAlignment]
// FloatingActionButton [onPressed - child]
// Icon [Icons.add]
// SizedBox [width - height]
// IconButton [icon - onPressed]
// Navigator - Navigation Stack
// Assets - Image 
// Text Field
// Media query
// anonymous routing vs Named routing
// Text Button
// Text Form Field
// Global Key
// Expanded 
// Container
// Data persistense 
// 1- key : value  sharedprefs 

