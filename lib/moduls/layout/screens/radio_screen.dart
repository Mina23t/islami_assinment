import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../core/thems/themes.dart';
import '../provider/settings_provider.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        SizedBox(height: 120),
        Image(image: AssetImage("assets/images/radio_image.png")),
        SizedBox(height: 30),
        Text(
          "aliza3a".tr(),
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(height: 55),
        Image.asset(
          "assets/images/Group 5.png",
          color: provider.themeMode == ThemeMode.light
              ? AppTheme.yellowLightColor
              : AppTheme.yellowDarkColor,
        )
      ],
    );
  }
}
