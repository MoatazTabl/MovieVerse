import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieverse/features/Home/Presentation/manager/trending_movies/trending_movies_cubit.dart';
import 'package:movieverse/features/Home/Presentation/views/widgets/trending_list_view_item.dart';

class TrendingListView extends StatelessWidget {
  const TrendingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMoviesCubit, TrendingMoviesState>(
      builder: (context, state) {
        if (state is TrendingMoviesSuccess) {
          return CarouselSlider.builder(
            itemCount: state.trendingMovies.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return TrendingListViewItem(
                trendingMoviesResultsModel: state.trendingMovies[index],
                tag: realIndex.toString(),
              );
            },
            options: CarouselOptions(
                scrollDirection: Axis.horizontal,
                enlargeCenterPage: true,
                animateToClosest: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enableInfiniteScroll: false,
                height: 336.h,
                initialPage: 1),
          );
        } else if (state is TrendingMoviesFailure) {
          return SizedBox(
              height: 336.h,
              width: 240.w,
              child: Center(
                child: Text(state.errorMessage),
              ));
        } else {
          return SizedBox(
              height: 336.h,
              width: 240.w,
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
