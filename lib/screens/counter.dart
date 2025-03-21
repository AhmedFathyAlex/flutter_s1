import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
   Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter'),),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: Icon(Icons.remove)),
            Padding(
              padding: const EdgeInsets.only(left: 20,right:10),
              child: Text('$counter',style: TextStyle(fontSize: 40),),
            ),
            ElevatedButton(onPressed: (){}, child: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}


// class StatefulCounter extends StatefulWidget{

//   @override
//   CounterState createState()=>  CounterState();
  
// }

// class CounterState extends State<StatefulCounter>{
//   @override
//   Widget build(BuildContext context) {
 
//   }

// }