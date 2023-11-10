import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterScreenRichText extends StatelessWidget {
  const RegisterScreenRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.h),
        child: RichText(
          text: TextSpan(text: "Don’t have an account? ", style: Theme
              .of(context)
              .textTheme
              .headlineMedium, children: [
            TextSpan(
              text: "Register Now",
              style: const TextStyle(
                color: Color(
                  0xff35C2C1,
                ),
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.push("/registerScreen");
                },
            )
          ]),
        ),
      ),
    );
  }
}
