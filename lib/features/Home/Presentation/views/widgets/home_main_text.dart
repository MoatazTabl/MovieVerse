import 'package:flutter/material.dart';

import '../../../../../core/utils/theme.dart';

class HomeMainText extends StatelessWidget {
  const HomeMainText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Movies ",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Theme.of(context).brightness==Brightness.dark?AppThemes.mainOrangeColor:AppThemes.mainTurquoiseColor),
        ),
        Text(
          "Everywhere",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}