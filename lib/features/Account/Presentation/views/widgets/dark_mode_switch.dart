import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieverse/core/utils/theme.dart';

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({super.key});

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box("darkModeSwitch").listenable(),
      builder: (BuildContext context, box, Widget? child) {
        return Switch.adaptive(
          value: box.get("darkMode", defaultValue: false),
          activeColor: AppThemes.mainOrangeColor,
          onChanged: (value) {
            setState(() {
              box.put("darkMode", value);
            });
          },
        );
      },
    );
  }
}
