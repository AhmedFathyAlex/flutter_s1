import 'package:flutter/material.dart';
import 'package:flutter_s1/bmi/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, this.child , this.isActive = true, this.onClick});
  final Widget? child;
  final bool isActive;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
             color: isActive ?  AppColors.activeContainer : AppColors.appbarBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}