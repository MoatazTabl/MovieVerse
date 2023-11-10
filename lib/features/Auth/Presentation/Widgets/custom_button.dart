import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieverse/core/utils/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.btnText,
    this.btnLogic,
    this.processing = false,
  });

  final String btnText;
  final bool? processing;
  final void Function()? btnLogic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.0.w, right: 22.0, bottom: 12.0),
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.w),
              ),
            ),
            fixedSize: MaterialStateProperty.all(Size(.8.sw, 56.h)),
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xff211F30)
                  : AppThemes.mainTurquoiseColor,
            )),
        onPressed: btnLogic,
        child: processing!
            ? const Center(child: CircularProgressIndicator())
            : Text(
                btnText,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
