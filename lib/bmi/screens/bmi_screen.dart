import 'package:flutter/material.dart';
import 'package:flutter_s1/bmi/app_colors.dart';
import 'package:flutter_s1/bmi/app_styles.dart';
import 'package:flutter_s1/bmi/widgets/custom_appbar.dart';
import 'package:flutter_s1/bmi/widgets/custom_button.dart';
import 'package:flutter_s1/bmi/widgets/custom_container.dart';
import 'package:flutter_s1/bmi/widgets/round_button.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = false;
  int age = 20;
  int weight = 60;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: Column(
          children: [
            CustomAppbar(),
            Expanded(
              child: Row(
                children: [
                  CustomContainer(
                    onClick: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    isActive: isMale,
                    child: Column(
                      children: [
                        Icon(Icons.male, size: 100, color: Colors.white),
                        Text('MALE', style: AppStyles.labelTextStyle),
                    
                      ],
                    ),
                  ),
                  CustomContainer(
                    onClick: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    isActive: !isMale,
                    child: Column(
                      children: [
                        Icon(Icons.female, size: 100, color: Colors.white),
                        Text('FEMALE', style: AppStyles.labelTextStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomContainer(),
            Expanded(
              child: Row(children: [CustomContainer(
                child: Column(
                  children: [
                    Text('WEIGHT',style: AppStyles.labelTextStyle,),
                    Text('$weight', style: AppStyles.numberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundButton(onClick: (){
                              setState(() {
                                weight--;
                              });
                            }, icon: Icons.remove),
                            RoundButton(onClick: (){
                              setState(() {
                                weight++;
                              });
                            },icon:Icons.add),
                          ],
                        )
                  ],
                ),
              ), CustomContainer(
                  child: Column(
                  children: [
                    Text('AGE',style: AppStyles.labelTextStyle,),
                    Text('$age', style: AppStyles.numberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundButton(onClick: (){
                              setState(() {
                                age--;
                              });
                            }, icon: Icons.remove),
                            RoundButton(onClick: (){
                              setState(() {
                                age++;
                              });
                            },icon:Icons.add),
                          ],
                        )
                  ],
                ),
              )]),
            ),
            CustomButton(title: 'Calculate'),
          ],
        ),
      ),
    );
  }
}
