import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.onPressed,required this.onSubmitted,
  });

  final TextEditingController textEditingController;

  final void Function()? onPressed;
  final void Function(String value)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        onSubmitted: onSubmitted,
        controller: textEditingController,
        textInputAction: TextInputAction.search,
        enabled: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.w),
            borderSide: BorderSide.none,
          ),
          fillColor: Theme.of(context).brightness==Brightness.dark? const Color(0xff211F30):const Color(0xffffffff),
          filled: true,
          prefixIcon: IconButton(
            onPressed: onPressed,
            icon:  Icon(Icons.search_outlined,color: Theme.of(context).brightness==Brightness.light? Colors.black:Colors.white),
          ),
          hintText: "Search",
          hintStyle: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
