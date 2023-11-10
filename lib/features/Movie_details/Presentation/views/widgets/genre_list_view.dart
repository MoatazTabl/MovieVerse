import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_detail_model.dart';

import 'genre_chip_item.dart';

class GenreChipListView extends StatelessWidget {
  const GenreChipListView({super.key, required this.movieDetail});

  final MovieDetailModel movieDetail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.5.sw,
      height: 35.h,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: movieDetail.genres?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GenreChip(genreName: movieDetail.genres?[index].name);
        },
      ),
    );
  }
}
