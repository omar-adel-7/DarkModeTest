// use it with "Theme.of(context).gotoScreenContainerColor"
import 'package:dark_mode/utils/color_manager.dart';
import 'package:flutter/material.dart';

extension CustomThemeDataExt on ThemeData {

  Color get gotoScreenContainerColor => brightness == Brightness.light
      ? ColorManager.blue
      : ColorManager.brown;

  Color get toggleModeContainerColor => brightness == Brightness.light
      ? ColorManager.red
      : ColorManager.green;

  Color get gotoScreenTextColor => brightness == Brightness.light
      ? ColorManager.black
      : ColorManager.white;

  Color get toggleModeTextColor => brightness == Brightness.light
      ? ColorManager.black
      : ColorManager.white;

  }


