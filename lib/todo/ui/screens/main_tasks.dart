import 'package:flutter/material.dart';
import 'package:flutter_s1/todo/ui/screens/all_tasks.dart';

class MainTasks extends StatefulWidget {
  const MainTasks({super.key});

  @override
  State<MainTasks> createState() => _MainTasksState();
}

class _MainTasksState extends State<MainTasks> {
  List<Widget> pages = [
    AllTasks(), 
    Text('Done'),
    Text('Archived'),
  ]; 

  int index = 0; 
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.all_inbox), label: 'all tasks'),
        BottomNavigationBarItem(icon: Icon(Icons.done_all), label: 'Done tasks'),
        BottomNavigationBarItem(icon: Icon(Icons.archive_rounded), label: 'Archived tasks'),
      ], 
      onTap: (value) {
        setState(() {
          index = value;
        });
      },
      currentIndex: index,
      ),
      body: pages[index],
    );
  }
}