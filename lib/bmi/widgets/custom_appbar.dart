import 'package:flutter/material.dart';
import 'package:flutter_s1/bmi/app_colors.dart';
import 'package:flutter_s1/bmi/app_styles.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      color: AppColors.appbarBackground,
      width: double.infinity,
      height: 50,
      child: Text('BMI CALCULATOR',style: AppStyles.appbarTextStyle,),
    );
  }
}