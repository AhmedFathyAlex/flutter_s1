import 'package:flutter/material.dart';

class Flag extends StatelessWidget {
  const Flag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
               decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
               decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Coat_of_arms_of_Egypt_%28Official%29.svg/2000px-Coat_of_arms_of_Egypt_%28Official%29.svg.png'),
              ),
            ),
             Expanded(
               child: Container(
                width: double.infinity,
               decoration: BoxDecoration(
                  color: Colors.black,
                ),
                           ),
             ),
          ],
        ),
      ),
    );
  }
}