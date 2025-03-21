import 'package:flutter/material.dart';
import 'package:flutter_s1/screens/flag.dart';
import 'package:flutter_s1/screens/home.dart';
import 'package:flutter_s1/screens/signin.dart';
import 'package:flutter_s1/screens/signup.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home' : (context) => Home(),
        '/signup' : (context) => Signup(),
        '/signin' : (context) => Signin(),
        '/flag' : (context) => Flag(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/flag',
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

