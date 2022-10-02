// ignore_for_file: unnecessary_new

part of 'theme.dart';

class AppInputStyle {
  final InputDecoration primary = InputDecoration(
    hintStyle: textStyle.greyText.copyWith(
      fontSize: fontSize.small,
    ),
    isCollapsed: true,
    border: InputBorder.none,
  );
}

AppInputStyle inputStyle = new AppInputStyle();
