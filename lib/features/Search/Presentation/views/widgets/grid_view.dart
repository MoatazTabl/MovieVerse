import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieverse/core/common_models/movie_list.dart';

import 'grid_view_item.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({super.key, required this.movieDetail});

  final List<MovieList> movieDetail;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: movieDetail.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 220.h),
        itemBuilder: (context, index) {
          return GridViewItem(
            tag: "image$index",
            movieDetail: movieDetail[index],
          );
        },
      ),
    );
  }
}
