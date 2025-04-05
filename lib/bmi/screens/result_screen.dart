import 'package:flutter/material.dart';
import 'package:flutter_s1/bmi/app_colors.dart';
import 'package:flutter_s1/bmi/app_styles.dart';
import 'package:flutter_s1/bmi/widgets/custom_appbar.dart';
import 'package:flutter_s1/bmi/widgets/custom_button.dart';
import 'package:flutter_s1/bmi/widgets/custom_container.dart';

class ResultScreen extends StatelessWidget {
   ResultScreen({super.key, required this.result , required this.message});
  final double result;
  final String message;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(), 
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Your Result' , style: AppStyles.numberTextStyle,),
            ), 
            CustomContainer(margin: 15,child: Column(children: [
              SizedBox(height: 30,),
              Text(message, style: AppStyles.resultTextStyle,),
              SizedBox(height: 15,),
              Text('${result.toStringAsFixed(1)}' , style: AppStyles.numberTextStyle.copyWith(fontSize: 64),)
            ],),), 
            CustomButton(title: 'RE-CALCULATE' , onClick: () {
              Navigator.pop(context);
            },)
          ],
        ),
      ),
    );
  }
}