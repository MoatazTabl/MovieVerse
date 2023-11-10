import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieverse/features/Movie_details/Presentation/manager/movie_detail_cubit.dart';
import 'package:movieverse/features/Movie_details/Presentation/manager/similar_movies_cubit.dart';
import 'package:movieverse/features/Movie_details/Presentation/manager/top_cast_cubit.dart';
import 'package:movieverse/features/Movie_details/Presentation/views/widgets/movie_short_info.dart';
import 'package:movieverse/features/Movie_details/Presentation/views/widgets/movie_shot_info.dart';
import 'package:movieverse/features/Movie_details/Presentation/views/widgets/related_movie_list_view.dart';
import 'package:movieverse/features/Movie_details/Presentation/views/widgets/return_button.dart';
import 'package:movieverse/features/Movie_details/Presentation/views/widgets/top_cast_list_view.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_with_tag.dart';

class MoviesDetailsScreen extends StatefulWidget {
  const MoviesDetailsScreen({
    super.key,
    required this.movieWithTag,
  });

  final MovieWithTag movieWithTag;

  @override
  State<MoviesDetailsScreen> createState() => _MoviesDetailsScreenState();
}

class _MoviesDetailsScreenState extends State<MoviesDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<MovieDetailCubit>(context)
        .fetchMovieDetail(movieId: widget.movieWithTag.movieId);
    BlocProvider.of<SimilarMoviesCubit>(context)
        .fetchSimilarMovies(movieId: widget.movieWithTag.movieId);
    BlocProvider.of<TopCastCubit>(context)
        .fetchTopCast(movieId: widget.movieWithTag.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: widget.movieWithTag.tag,
                    child: CachedNetworkImage(
                      maxHeightDiskCache: 900,
                      maxWidthDiskCache: 900,
                      imageUrl:
                          "https://image.tmdb.org/t/p/original/${widget.movieWithTag.imgUrl}",
                      fit: BoxFit.fitWidth,
                      height: 287.h,
                      width: double.infinity,
                      errorWidget: (context, url, error) {
                        return SizedBox(
                          width: double.infinity,
                          height: 287.h,
                          child: const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        );
                      },
                    ),
                  ),
                  const ReturnButton(),
                ],
              ),
              BlocBuilder<MovieDetailCubit, MovieDetailState>(
                builder: (context, state) {
                  if (state is MovieDetailSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 24.h, left: 24.w, bottom: 8.h),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${state.movieDetail.title}",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                        ),
                        MovieQuickInfo(movieDetail: state.movieDetail),
                        SizedBox(
                          height: 15.h,
                        ),
                        Divider(
                          height: 1,
                          thickness: 0.2,
                          color: const Color(0xff515151),
                          indent: 24.w,
                          endIndent: 24.w,
                        ),
                        MovieShortInfo(
                          movieDetail: state.movieDetail,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Divider(
                          height: 1,
                          thickness: 0.2,
                          color: const Color(0xff515151),
                          indent: 24.w,
                          endIndent: 24.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.h, left: 24.w, bottom: 8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Synopsis",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              Text(
                                "${state.movieDetail.overview}",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.h, left: 24.w, bottom: 16.h),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Top Cast",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        ),
                        const TopCastListView(),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.h, left: 24.w, bottom: 16.h),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Related Movies",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        ),
                        const RelatedMovieListView(),
                      ],
                    );
                  } else if (state is MovieDetailFailure) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

