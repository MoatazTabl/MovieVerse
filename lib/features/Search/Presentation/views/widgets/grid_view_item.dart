import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movieverse/core/common_models/movie_list.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_with_tag.dart';

import '../../../../../core/utils/theme.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
    required this.tag,
    required this.movieDetail,
  });

  final String tag;
  final MovieList movieDetail;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/moviesDetailsScreen",
            extra: MovieWithTag(
                tag, movieDetail.id!, movieDetail.posterPath ?? ""));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: tag,
            child: CachedNetworkImage(
              maxWidthDiskCache: 400,
              maxHeightDiskCache:500,
              imageUrl:
                  "https://image.tmdb.org/t/p/original/${movieDetail.posterPath}",
              imageBuilder: (context, imageProvider) => Container(
                height: 184.h,
                width: 154.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.w),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.fill)),
              ),
              errorWidget: (context, url, error) {
                return SizedBox(
                  height: 184.h,
                  width: 154.w,
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
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints.loose(Size(146.w, 19.h)),
                child: Text(
                  "${movieDetail.title}",
                  style: Theme.of(context).textTheme.headlineMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                "${movieDetail.releaseDate!.length > 3 ? movieDetail.releaseDate?.substring(0, 4) : movieDetail.releaseDate}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: const Color(0xffBCBCBC)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
