import 'package:flutter/material.dart';
import 'package:yatirimci_uygulamamiz/core/utils/size_utils.dart';
import 'package:yatirimci_uygulamamiz/theme/theme_helper.dart';

class TextThemeHelper {
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w400,
      );
  static get bodySmall8 => theme.textTheme.bodySmall!.copyWith(
        fontSize: getFontSize(
          8,
        ),
      );
  static get bodySmall9 => theme.textTheme.bodySmall!.copyWith(
        fontSize: getFontSize(
          9,
        ),
      );
  static get bodyMediumRockwellGray400 =>
      theme.textTheme.bodyMedium!.rockwell.copyWith(
        color: appTheme.gray400,
        fontWeight: FontWeight.w400,
      );
  static get labelLargeExtraBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w800,
      );
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: getFontSize(
          13,
        ),
      );
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get postNoBillsColomboSemiBold {
    return copyWith(
      fontFamily: 'Post No Bills Colombo SemiBold',
    );
  }

  TextStyle get rockwell {
    return copyWith(
      fontFamily: 'Rockwell',
    );
  }
}
