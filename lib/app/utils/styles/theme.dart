// ignore_for_file: non_constant_identifier_names, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_app/app/utils/styles/layout_config.dart';
import 'package:google_fonts/google_fonts.dart';

part 'color.dart';
part 'font_style.dart';
part 'font_weight.dart';
part 'font_size.dart';
part 'text_style.dart';
part 'box_shadow.dart';
part 'input_style.dart';
part 'button_style.dart';

class AppTheme {
  ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
    );
  }

  ThemeData light() {
    return ThemeData.light().copyWith(
      primaryColor: color.purple,
      colorScheme: ColorScheme.light(
        primary: color.purple,
        secondary: color.lightGreen,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: color.purple,
        foregroundColor: color.black,
      ),
    );
  }

  CupertinoThemeData iosDark() {
    return const CupertinoThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
    );
  }

  CupertinoThemeData iosLight() {
    return const CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
    );
  }
}

AppTheme theme = new AppTheme();
