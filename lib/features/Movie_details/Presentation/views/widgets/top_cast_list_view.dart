import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieverse/features/Movie_details/Presentation/manager/top_cast_cubit.dart';
import 'package:movieverse/features/Movie_details/Presentation/views/widgets/top_cast_list_view_item.dart';

class TopCastListView extends StatelessWidget {
  const TopCastListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopCastCubit, TopCastState>(
      builder: (context, state) {
        if (state is TopCastSuccess) {
          return SizedBox(
            height: 146.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 24.w),
              itemCount: state.topCast.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TopCastListViewItem(
                  topCastModel: state.topCast[index],
                );
              },
            ),
          );
        } else if (state is TopCastFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
