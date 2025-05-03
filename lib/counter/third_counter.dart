import 'package:flutter/material.dart';
import 'package:flutter_s1/counter/counter_provider.dart';
import 'package:provider/provider.dart';

class ThirdCounter extends StatelessWidget {
  const ThirdCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
       mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Third screen'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              context.read<CounterProvider>().decrement();
            }, icon: Icon(Icons.remove)) , 
           Consumer<CounterProvider>(
            builder: (context, value, child) {
              return Text('${value.counter}');
            },
            ),  
            IconButton(onPressed: (){
              context.read<CounterProvider>().increment();
            }, icon: Icon(Icons.add)) , 
          ],
        ),
      ],
    );
  }
}