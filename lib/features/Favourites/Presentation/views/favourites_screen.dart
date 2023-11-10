import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieverse/core/utils/hive/hive_fav_movies.dart';
import 'package:movieverse/core/utils/theme.dart';
import 'package:movieverse/features/Favourites/Presentation/views/widgets/fav_list_view_item.dart';
import 'package:movieverse/features/Movie_details/Presentation/manager/movie_fav_cubit.dart';
import 'package:movieverse/features/Movie_details/data/repos/movie_fav_repo_impl.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Favourite Movies",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppThemes.mainOrangeColor
                            : AppThemes.mainTurquoiseColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: Hive.box<FavMovies>("MovieFav").listenable(),
            builder: (BuildContext context, value, Widget? child) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: value.length,
                (context, index) {
                  List<FavMovies>? movies = value.values.toList();
                  return BlocProvider(
                    create: (context) => MovieFavCubit(MovieFavRepoImpl())
                      ..checkIfDuplicate(movieId: movies[index].id ?? 0),
                    child: FavouritesListViewItem(
                      favMovies: movies[index],
                      tag: "$index",
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
