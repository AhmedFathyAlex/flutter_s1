import 'package:flutter/material.dart';
import 'package:flutter_s1/bmi/app_colors.dart';
import 'package:flutter_s1/bmi/widgets/custom_appbar.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: Column(
          children: [
            CustomAppbar()
          ],
        ),
      ),
    );
  }
}