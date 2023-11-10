import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movieverse/core/common_models/movie_list.dart';
import 'package:movieverse/core/utils/theme.dart';
import 'package:movieverse/features/Home/Presentation/manager/top_rated/top_rated_cubit.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_with_tag.dart';

class ContinueWatchingWidget extends StatelessWidget {
  const ContinueWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedCubit, TopRatedState>(
      builder: (context, state) {
        if (state is TopRatedSuccess) {
          return CarouselSlider.builder(
            itemBuilder: (context, index, realIndex) {
              return ContinueWatchingItem(
                tag: '$realIndex',
                topRated: state.movieList[index],
              );
            },
            itemCount: state.movieList.length,
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              animateToClosest: true,
              initialPage: 0,
              height: 191.h,
              autoPlay: true,
              enableInfiniteScroll: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 5),
            ),
          );
        } else if (state is TopRatedFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return SizedBox(
            width: 327.w,
            height: 191.h,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class ContinueWatchingItem extends StatelessWidget {
  const ContinueWatchingItem({
    super.key,
    required this.tag,
    required this.topRated,
  });

  final String tag;
  final MovieList topRated;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/moviesDetailsScreen",
            extra: MovieWithTag(tag, topRated.id!, topRated.posterPath ?? ""));
      },
      child: Center(
        child: Stack(
          children: [
            CachedNetworkImage(
              maxHeightDiskCache: 500,
              maxWidthDiskCache: 500,
              imageUrl:
                  "https://image.tmdb.org/t/p/original/${topRated.posterPath}",
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      30.w,
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: 327.w,
                  height: 191.h,

                );
              },
              errorWidget: (context, url, error) {
                return const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 24,
                );
              },
              width: 327.w,
              height: 191.h,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 116.h,
              left: 12.w,
              bottom: 8.h,
              right: 104.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20).w,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                  child: Container(
                    decoration: BoxDecoration(color: AppThemes.frostedWhite),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 11.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Top Rated",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontSize: 15),
                              ),
                              ConstrainedBox(
                                constraints:
                                    BoxConstraints.tight(Size(140.w, 19.h)),
                                child: Text(
                                  topRated.title ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
