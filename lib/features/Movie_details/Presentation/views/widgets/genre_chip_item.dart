import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenreChip extends StatelessWidget {
  const GenreChip({super.key, required this.genreName});

  final String? genreName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 12.w),
      child: Chip(
        label: Text(
          genreName??"",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        labelPadding: EdgeInsets.zero,

        padding: EdgeInsets.symmetric(horizontal: 12.w),
        backgroundColor: const Color(0xffFAF0CA).withOpacity(0.05),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
      ),
    );
  }
}
