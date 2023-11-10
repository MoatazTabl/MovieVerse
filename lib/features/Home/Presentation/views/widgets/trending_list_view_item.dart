import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movieverse/core/common_models/movie_list.dart';
import 'package:movieverse/core/utils/theme.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_with_tag.dart';

import 'frosted_glass.dart';

class TrendingListViewItem extends StatelessWidget {
  const TrendingListViewItem({
    super.key,
    required this.trendingMoviesResultsModel,
    required this.tag,
  });

  final MovieList trendingMoviesResultsModel;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          context.push("/moviesDetailsScreen",
              extra: MovieWithTag(tag, trendingMoviesResultsModel.id!,
                  trendingMoviesResultsModel.posterPath ?? ""));
        },
        child: Stack(
          children: [
            Hero(
              tag: tag,
              child: CachedNetworkImage(
                maxWidthDiskCache: 500,
                maxHeightDiskCache: 500,
                imageUrl:
                    "https://image.tmdb.org/t/p/original/${trendingMoviesResultsModel.posterPath}",
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 336.h,
                    width: 240.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(30.w)),
                  );
                },
                errorWidget: (context, url, error) {
                  return const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 24,
                  );
                },
                width: 240.w,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 20.h,
                bottom: 200.h,
                right: 16.w,
                left: 162.w,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15).w,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      child: Container(
                        height: 46.h,
                        width: 77.w,
                        padding: EdgeInsets.zero,
                        decoration:
                            BoxDecoration(color: AppThemes.frostedWhite),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "TMDb",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 24,
                                    color: Colors.yellowAccent,
                                  ),
                                  Text(
                                    "${trendingMoviesResultsModel.voteAverage?.toStringAsPrecision(2)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            Positioned(
              top: 240.h,
              left: 16.w,
              bottom: 20.h,
              right: 16.w,
              child: FrostedGlass(
                movieDetail: trendingMoviesResultsModel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
