import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavouritesScreenButton extends StatelessWidget {
  const FavouritesScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/favouriteScreen");
      },
      child: Row(
        children: [
          Text(
            "Favourites",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Spacer(),
          const RotatedBox(
            quarterTurns: 3,
            child: Icon(Icons.expand_more),
          ),
        ],
      ),
    );
  }
}
