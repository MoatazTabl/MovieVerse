import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_detail_model.dart';

import 'genre_list_view.dart';

class MovieShortInfo extends StatelessWidget {
  const MovieShortInfo({super.key, required this.movieDetail});

  final MovieDetailModel movieDetail;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, left: 24.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Release date",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 31.h,
              ),
              Text(
                "${movieDetail.releaseDate}",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          SizedBox(
            width: 56.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Genre",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 12.h,
              ),
              GenreChipListView(
                movieDetail: movieDetail,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
