import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 48.h,
      left: 28.w,
      child:  IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color:  Colors.white,
          size: 36,
        ),


      ),
    );
  }
}
