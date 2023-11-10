import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieverse/core/utils/hive/hive_fav_movies.dart';
import 'package:movieverse/core/utils/theme.dart';
import 'package:movieverse/features/Movie_details/Presentation/manager/movie_fav_cubit.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton(
      {super.key, required this.isSelected, required this.favMovies});

  final bool isSelected;

  final FavMovies favMovies;

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        HapticFeedback.selectionClick();
        if (widget.isSelected == true) {
          confirmDialog(context,
              title: widget.favMovies.title ?? "Movie",
              movieId: widget.favMovies.id ?? 0);
        } else if (widget.isSelected == false) {
          BlocProvider.of<MovieFavCubit>(context).addToDb(
              movieId: widget.favMovies.id ?? 0,
              title: widget.favMovies.title ?? "",
              posterPath: widget.favMovies.posterPath ?? "",
              releaseDate: widget.favMovies.releaseDate ?? "",
              voteAverage: widget.favMovies.voteAverage ?? 0);
        }
      },
      icon: const Icon(Icons.favorite_border),
      isSelected: widget.isSelected,
      selectedIcon: Icon(
        Icons.favorite,
        color: Theme.of(context).brightness == Brightness.dark
            ? AppThemes.mainOrangeColor
            : AppThemes.mainTurquoiseColor,
      ),
    );
  }

  void confirmDialog(BuildContext context,
      {required String title, required int movieId}) {
    showAdaptiveDialog(
      context: context,
      builder: (innerContext) {
        return AlertDialog.adaptive(
          actionsAlignment: MainAxisAlignment.center,
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          content:
              const Text("Sure you Wanna Delete this movie from this list?"),
          actions: [
            TextButton(
              onPressed: () async {
                if (context.mounted) {
                  context.pop();
                }
                await BlocProvider.of<MovieFavCubit>(context)
                    .removeFromDb(movieId: movieId);


              },
              child: Text(
                "Yes",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: const Color(0xffff3333)),
              ),
            ),
            TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  "Cancel",
                  style: Theme.of(context).textTheme.headlineMedium,
                ))
          ],
        );
      },
    ).then(
      (value) {
        setState(
          () {
            BlocProvider.of<MovieFavCubit>(context)
                .checkIfDuplicate(movieId: widget.favMovies.id ?? 0);
          },
        );
      },
    );
  }
}
