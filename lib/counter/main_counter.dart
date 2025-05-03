import 'package:flutter/material.dart';
import 'package:flutter_s1/counter/first_counter.dart';
import 'package:flutter_s1/counter/seconed_counter.dart';
import 'package:flutter_s1/counter/third_counter.dart';


class MainCounter extends StatefulWidget {
  const MainCounter({super.key});

  @override
  State<MainCounter> createState() => _MainCounterState();
}

class _MainCounterState extends State<MainCounter> {

  List<Widget> pages = [
    FirstCounter(),
   SeconedCounter(),
    ThirdCounter()
  ]; 

  int index = 0;

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Screen'),),
      bottomNavigationBar: BottomNavigationBar(
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.first_page), label: 'First'),
        BottomNavigationBarItem(icon: Icon(Icons.two_k), label: 'Second'),
        BottomNavigationBarItem(icon: Icon(Icons.three_g_mobiledata), label: 'Third'),
      ], 
      onTap: (value) {
        setState(() {
          index = value;
        });
      },
      ),

      body: Center(child: pages[index]),
    );
  }
}