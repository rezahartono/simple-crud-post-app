import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final Function onPressed;
  final ButtonStyle style;
  final MainAxisAlignment labelAlignment;
  final Widget label;
  final double width;
  final double height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomButton({
    Key? key,
    this.margin = EdgeInsets.zero,
    required this.onPressed,
    required this.style,
    this.labelAlignment = MainAxisAlignment.center,
    required this.label,
    this.width = double.infinity,
    required this.height,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: style,
        child: Row(
          mainAxisAlignment: labelAlignment,
          children: [
            prefixIcon ?? Container(),
            label,
            suffixIcon ?? Container(),
          ],
        ),
      ),
    );
  }
}
