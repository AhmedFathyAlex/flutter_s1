import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter extends StatefulWidget {
   Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}


class _CounterState extends State<Counter> {
  int counter = 0;
   @override
  void initState() {
    super.initState();
    getCounter();
  }

  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter'),),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async {
              
              setState(() {
                counter--;
                saveNewCounter();
              });
            }, child: Icon(Icons.remove)),
            Padding(
              padding: const EdgeInsets.only(left: 20,right:10),
              child: Text('$counter',style: TextStyle(fontSize: 40),),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                counter++;
                saveNewCounter();
              });
            }, child: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }

  saveNewCounter()async{
  var sp = await SharedPreferences.getInstance();
  sp.setInt('counter', counter);
  }

  getCounter()async{
 var sp = await SharedPreferences.getInstance();
  int count = sp.getInt('counter') ?? 0 ; 
  setState(() {
    counter = count;
  });
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