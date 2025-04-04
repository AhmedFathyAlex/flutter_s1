import 'package:flutter/material.dart';
import 'package:flutter_s1/bmi/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key , this.icon, required this.onClick});
  final IconData? icon;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.labelTextColor,
          shape: BoxShape.circle
        ),
        height: 42,
        width: 40,
        child: Icon(icon,color: Colors.white,size: 30,
      ),
      )
    );
  }
}