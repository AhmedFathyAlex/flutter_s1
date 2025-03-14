import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to DEPI'),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(onPressed: (){
              print('Search Clicked');
            }, icon: Icon(Icons.search)),
            IconButton(onPressed: (){
              print('More Clicked');
            }, icon: Icon(Icons.more_vert),),
            IconButton(onPressed: (){
              print('Notification Clicked');
            }, icon: Icon(Icons.notifications),)
          ],
          leading: Icon(Icons.arrow_back),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'Flutter',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Alexandria',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
                Row(
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'Flutter',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Alexandria',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
                Row(
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    'Flutter',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Alexandria',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FAB Clicked');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

// Material App (root widget) [home - debugShowCheckedModeBanner]
// Scaffold [appBar - body]
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
