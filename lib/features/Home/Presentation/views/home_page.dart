import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieverse/features/Home/Presentation/views/widgets/continue_watching.dart';
import 'package:movieverse/features/Home/Presentation/views/widgets/home_main_text.dart';
import 'package:movieverse/features/Home/Presentation/views/widgets/trending_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.w, top: 44.h, bottom: 24.h),
          child: const HomeMainText(),
        ),
        const ContinueWatchingWidget(),
        SizedBox(
          height: 36.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Text(
            "Trending",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        const TrendingListView(),
      ],
    );
  }
}
