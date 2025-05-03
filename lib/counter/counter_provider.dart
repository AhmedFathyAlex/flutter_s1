import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  // data to listen
  // high level variable , observable
int counter = 0;

// operation on data

void increment(){
  counter++;
  //notify
  notifyListeners();
}

void decrement(){
  counter--;
  notifyListeners();
}
} 