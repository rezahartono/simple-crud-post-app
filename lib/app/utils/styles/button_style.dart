// ignore_for_file: unnecessary_new

part of 'theme.dart';

class AppButtonStyle {
  ButtonStyle primary = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) => color.lightBlue,
    ),
    shape: MaterialStateProperty.resolveWith(
      (states) => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          layoutConfig.safeBlockVertical * 6.5,
        ),
      ),
    ),
    textStyle: MaterialStateProperty.resolveWith(
      (states) => textStyle.whiteText,
    ),
  );
  ButtonStyle danger = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith(
      (states) => color.red,
    ),
    shape: MaterialStateProperty.resolveWith(
      (states) => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          layoutConfig.safeBlockVertical * 6.5,
        ),
      ),
    ),
    textStyle: MaterialStateProperty.resolveWith(
      (states) => textStyle.whiteText,
    ),
  );
}

AppButtonStyle buttonStyle = new AppButtonStyle();
