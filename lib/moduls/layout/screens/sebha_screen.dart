import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

import '../../../core/thems/themes.dart';
import '../provider/settings_provider.dart';

class SebhaScreen extends StatefulWidget {
  @override
  SebhaScreenState createState() => SebhaScreenState();
}

class SebhaScreenState extends State<SebhaScreen>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  double rotationAngle = 0;

  void IncrementCounter() {
    setState(() {
      counter++;
      rotationAngle += pi / 2;

      if (counter > 33) {
        counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 20),
              child: Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(provider.themeMode == ThemeMode.light
                      ? "assets/images/head_sebha_logo.png"
                      : "assets/images/head_sebha_dark.png"),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 102),
                GestureDetector(
                  onTap: IncrementCounter,
                  child: Transform.rotate(
                      angle: rotationAngle,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(provider.themeMode == ThemeMode.light
                            ? "assets/images/body_sebha_logo.png"
                            : "assets/images/body_sebha_dark.png"),
                      )),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 30),
        Text(
          'tasbeh'.tr(),
          style: TextStyle(fontSize: 24),
        ),
        Text(
          '$counter',
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
        MaterialButton(
          onPressed: IncrementCounter,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
          color: provider.themeMode == ThemeMode.light
              ? AppTheme.yellowLightColor
              : AppTheme.yellowDarkColor,
          child: Text('sobhan allah'.tr(),
              style: TextStyle(
                fontSize: 15,
              )),
        )
      ],
    );
  }
}
