import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginUsingServiceButton extends StatelessWidget {
  const LoginUsingServiceButton({
    super.key,
    required this.imgPath,required this.login,
  });

  final String imgPath;

  final void Function()? login;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.w),
            side: BorderSide(
              color: const Color(0xffE8ECF4).withOpacity(0.8),
            ),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 10.h),
        ),
      ),
      onPressed: login,
      child: Image.asset(
        imgPath,
        height: 26.h,
      ),
    );
  }
}