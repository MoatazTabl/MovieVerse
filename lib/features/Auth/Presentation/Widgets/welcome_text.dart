import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 23.w),
      child: Text(
        "Welcome back! \nGlad to see you, Again!",
        style: Theme
            .of(context)
            .textTheme
            .headlineLarge
            ?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
