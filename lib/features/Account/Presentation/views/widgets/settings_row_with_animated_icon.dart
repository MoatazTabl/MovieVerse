import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieverse/core/utils/theme.dart';

class SettingsRowWithAnimatedIcon extends StatefulWidget {
  const SettingsRowWithAnimatedIcon({
    super.key,
  });

  @override
  State<SettingsRowWithAnimatedIcon> createState() =>
      _SettingsRowWithAnimatedIconState();
}

class _SettingsRowWithAnimatedIconState
    extends State<SettingsRowWithAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RotationTransition(
          turns: Tween(
            begin: 0.0,
            end: 1.0,
          ).animate(_animationController),
          child: Icon(
            Icons.settings,
            size: 40,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppThemes.mainOrangeColor
                : AppThemes.mainTurquoiseColor,
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          "Settings",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
