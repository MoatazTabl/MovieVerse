import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieverse/features/Movie_details/Presentation/manager/similar_movies_cubit.dart';
import 'package:movieverse/features/Movie_details/Presentation/views/widgets/related_movie_item.dart';

class RelatedMovieListView extends StatelessWidget {
  const RelatedMovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 146.h,
      child: BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
        builder: (context, state) {
          if (state is SimilarMoviesSuccess) {
            return ListView.builder(
              padding: EdgeInsets.only(left: 24.w),
              itemCount: state.movieDetailModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return RelatedMovieItem(
                  movieDetailModel: state.movieDetailModel[index],
                );
              },
            );
          } else if (state is SimilarMoviesFailure) {
            return Text(state.errorMessage);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
