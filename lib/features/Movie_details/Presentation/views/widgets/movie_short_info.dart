import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieverse/core/utils/theme.dart';
import 'package:movieverse/features/Movie_details/Presentation/manager/movie_fav_cubit.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_detail_model.dart';

class MovieQuickInfo extends StatefulWidget {
  const MovieQuickInfo({super.key, required this.movieDetail});

  final MovieDetailModel movieDetail;

  @override
  State<MovieQuickInfo> createState() => _MovieQuickInfoState();
}

class _MovieQuickInfoState extends State<MovieQuickInfo> {
  bool isSelected = false;

  @override
  void initState() {
    BlocProvider.of<MovieFavCubit>(context)
        .checkIfDuplicate(movieId: widget.movieDetail.id ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h, left: 24.w, bottom: 8.h),
      child: Row(
        children: [
          Icon(
            Icons.access_time_sharp,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppThemes.mainOrangeColor
                : AppThemes.mainTurquoiseColor,
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            durationToString(widget.movieDetail.runtime ?? 0),
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: const Color(0xffC4C4C4)),
          ),
          SizedBox(
            width: 12.w,
          ),
          Icon(
            Icons.star,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppThemes.mainOrangeColor
                : AppThemes.mainTurquoiseColor,
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            "${widget.movieDetail.voteAverage?.toStringAsPrecision(2)}  (TMDb)",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: const Color(0xffC4C4C4)),
          ),
          const Spacer(),
          BlocBuilder<MovieFavCubit, MovieFavState>(
            builder: (context, state) {
              if (state is MovieFavExistsInDb) {
                isSelected = true;
              } else if (state is MovieFavAddedToDb) {
                isSelected = true;
              } else if (state is MovieFavRemoveFromDb) {
                isSelected = false;
              }
              return IconButton(
                onPressed: () {
                  HapticFeedback.heavyImpact();
                  if (isSelected == true) {
                    BlocProvider.of<MovieFavCubit>(context)
                        .removeFromDb(movieId: widget.movieDetail.id ?? 0);
                  } else if (isSelected == false) {
                    BlocProvider.of<MovieFavCubit>(context).addToDb(
                        movieId: widget.movieDetail.id ?? 0,
                        title: widget.movieDetail.title ?? "",
                        posterPath: widget.movieDetail.posterPath ?? "",
                        releaseDate: widget.movieDetail.releaseDate ?? "",
                        voteAverage: widget.movieDetail.voteAverage ?? 0);
                  }
                },
                icon: const Icon(Icons.favorite_border),
                isSelected: isSelected,
                selectedIcon: Icon(
                  Icons.favorite,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppThemes.mainOrangeColor
                      : AppThemes.mainTurquoiseColor,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}m';
  }
}
