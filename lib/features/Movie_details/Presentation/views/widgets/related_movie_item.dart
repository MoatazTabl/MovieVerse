import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movieverse/core/utils/theme.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_detail_model.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_with_tag.dart';

class RelatedMovieItem extends StatelessWidget {
  const RelatedMovieItem({super.key, required this.movieDetailModel});

  final MovieDetailModel movieDetailModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: InkWell(
        onTap: () {
          context.push("/moviesDetailsScreen",
              extra: MovieWithTag(movieDetailModel.id.toString(),
                  movieDetailModel.id!, movieDetailModel.posterPath ?? ""));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: movieDetailModel.id.toString(),
              child: CachedNetworkImage(
                maxWidthDiskCache: 300,
                maxHeightDiskCache: 300,
                imageUrl:
                    "https://image.tmdb.org/t/p/original/${movieDetailModel.posterPath}",
                imageBuilder: (context, imageProvider) => Container(
                  height: 106.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.fill)),
                ),
                errorWidget: (context, url, error) {
                  return SizedBox(
                    height: 106.h,
                    width: 120.w,
                    child: const Center(
                        child: Icon(
                      Icons.error,
                      color: Colors.red,
                    )),
                  );
                },
                placeholder: (context, url) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppThemes.mainOrangeColor,
                    ),
                  );
                },
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 142.w, maxHeight: 92.h),
              child: Text(
                movieDetailModel.title ?? "",
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
