import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/core/utils/size_utils.dart';
import 'package:yatirimci_uygulamamiz/theme/theme_helper.dart';

class AppDecoration {
  static BoxDecoration get fill => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get outline2 => BoxDecoration(
        color: appTheme.blueA200,
        border: Border.all(
          color: appTheme.black900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outline1 => BoxDecoration(
        color: appTheme.indigo600C1,
        border: Border.all(
          color: appTheme.black900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outline4 => BoxDecoration(
        border: Border.all(
          color: appTheme.black900,
          width: getHorizontalSize(
            2,
          ),
        ),
      );
  static BoxDecoration get outline3 => BoxDecoration(
        color: appTheme.black900.withOpacity(0.94),
        border: Border.all(
          color: appTheme.black900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outline => BoxDecoration(
        border: Border.all(
          color: appTheme.black900,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get txtOutline => BoxDecoration();
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder15 = BorderRadius.circular(
    getHorizontalSize(
      15,
    ),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
