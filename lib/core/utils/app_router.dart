import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieverse/core/utils/app_service.dart';
import 'package:movieverse/features/Auth/Presentation/Manager/register_cubit.dart';
import 'package:movieverse/features/Auth/Presentation/login_screen.dart';
import 'package:movieverse/features/Auth/Presentation/register_screen.dart';
import 'package:movieverse/features/Favourites/Presentation/views/favourites_screen.dart';
import 'package:movieverse/features/Home/Presentation/manager/top_rated/top_rated_cubit.dart';
import 'package:movieverse/features/Home/Presentation/manager/trending_movies/trending_movies_cubit.dart';
import 'package:movieverse/features/Home/data/repos/home_repo_impl.dart';
import 'package:movieverse/features/Movie_details/Presentation/manager/movie_detail_cubit.dart';
import 'package:movieverse/features/Movie_details/Presentation/manager/movie_fav_cubit.dart';
import 'package:movieverse/features/Movie_details/Presentation/manager/similar_movies_cubit.dart';
import 'package:movieverse/features/Movie_details/Presentation/manager/top_cast_cubit.dart';
import 'package:movieverse/features/Movie_details/data/models/movie_with_tag.dart';
import 'package:movieverse/features/Movie_details/data/repos/movie_detail_repo_impl.dart';
import 'package:movieverse/features/Movie_details/data/repos/movie_fav_repo_impl.dart';
import 'package:movieverse/features/Movie_details/data/repos/similar_movie_repo_impl.dart';
import 'package:movieverse/features/Movie_details/data/repos/top_cast_repo_impl.dart';
import 'package:movieverse/features/Search/Presentation/Manager/search_cubit.dart';
import 'package:movieverse/features/Search/data/repos/search_repo_impl.dart';
import 'package:movieverse/features/Splash/presentation/splash_screen.dart';

import 'package:movieverse/main_screen.dart';

import '../../features/Movie_details/Presentation/views/movies_details_screen.dart';

part 'redirection.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    redirect: _redirect,
    debugLogDiagnostics: true,
    refreshListenable: AppService.instance,
    navigatorKey: AppService.instance.navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/loginScreen',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/registerScreen',
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
              create: (BuildContext context) => RegisterCubit(),
              child: const RegisterScreen());
        },
      ),
      GoRoute(
        path: '/mainScreen',
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => TrendingMoviesCubit(HomeRepoImpl())
                    ..fetchTrendingMovies()),
              BlocProvider(
                  create: (context) =>
                      TopRatedCubit(HomeRepoImpl())..fetchTopRatedMovies()),
              BlocProvider(create: (context) => SearchCubit(SearchRepoImpl())),
            ],
            child: const MainScreen(),
          );
        },
      ),
      GoRoute(
        path: '/favouriteScreen',
        builder: (BuildContext context, GoRouterState state) {
          return const FavouritesScreen();
        },
      ),
      GoRoute(
        path: '/moviesDetailsScreen',
        builder: (BuildContext context, GoRouterState state) {
          var movieDetail = state.extra! as MovieWithTag;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => MovieDetailCubit(MovieDetailRepoImpl()),
              ),
              BlocProvider(
                create: (context) =>
                    SimilarMoviesCubit(SimilarMoviesRepoImpl()),
              ),
              BlocProvider(
                create: (context) => MovieFavCubit(MovieFavRepoImpl()),
              ),
              BlocProvider(
                create: (context) => TopCastCubit(TopCastRepoImpl()),
              ),
            ],
            child: MoviesDetailsScreen(
              movieWithTag: movieDetail,
            ),
          );
        },
      ),
    ],
  );
}
