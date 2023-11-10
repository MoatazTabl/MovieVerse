import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movieverse/core/utils/hive/hive_fav_movies.dart';
import 'package:movieverse/core/utils/theme.dart';
import 'package:movieverse/features/Favourites/Presentation/views/widgets/favourite_button.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_with_tag.dart';

import '../../../../Movie_details/Presentation/manager/movie_fav_cubit.dart';

class FavouritesListViewItem extends StatefulWidget {
  const FavouritesListViewItem({
    super.key,
    required this.favMovies,
    required this.tag,
  });

  final FavMovies favMovies;
  final String tag;

  @override
  State<FavouritesListViewItem> createState() => _FavouritesListViewItemState();
}

class _FavouritesListViewItemState extends State<FavouritesListViewItem> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/moviesDetailsScreen",
            extra: MovieWithTag(widget.tag, widget.favMovies.id ?? 0,
                widget.favMovies.posterPath ?? ""));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: widget.tag,
              child: CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/original/${widget.favMovies.posterPath}",
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 150.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.w),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(maxWidth: 250.w),
                  child: Text(
                    widget.favMovies.title ?? "",
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppThemes.mainOrangeColor
                          : AppThemes.mainTurquoiseColor,
                      size: 28,
                    ),
                    Text(
                        "${widget.favMovies.voteAverage?.toStringAsPrecision(2)}",
                        style: Theme.of(context).textTheme.headlineMedium),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text("${widget.favMovies.releaseDate}",
                        style: Theme.of(context).textTheme.headlineMedium),
                    BlocBuilder<MovieFavCubit, MovieFavState>(
                      builder: (context, state) {
                        if (state is MovieFavExistsInDb) {
                          isSelected = true;
                        } else if (state is MovieFavAddedToDb) {
                          isSelected = true;
                        }

                        return FavouriteButton(
                            isSelected: isSelected,
                            favMovies: widget.favMovies);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
