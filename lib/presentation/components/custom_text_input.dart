import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:post_app/app/utils/styles/layout_config.dart';
import 'package:post_app/app/utils/styles/theme.dart';

class CustomTextInput extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final int? maxLines;
  final Widget? label;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final InputDecoration? decoration;

  const CustomTextInput({
    Key? key,
    this.margin,
    this.padding,
    this.borderRadius,
    this.width,
    this.height,
    this.maxLines,
    this.label,
    this.border,
    this.boxShadow,
    this.controller,
    this.obscureText = false,
    this.inputType,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.decoration,
  }) : super(key: key);

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  final _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: widget.width ?? layoutConfig.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: layoutConfig.defaultMargin / 2,
                  ),
                  child: widget.label,
                )
              : Container(),
          Container(
            height: widget.height,
            width: layoutConfig.screenWidth,
            padding: widget.padding ??
                EdgeInsets.symmetric(
                  horizontal: layoutConfig.defaultMargin / 2,
                ),
            decoration: BoxDecoration(
              color: color.white,
              borderRadius: widget.borderRadius,
              border: widget.border,
              boxShadow: widget.boxShadow,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: widget.controller ?? _inputController,
                    obscureText: widget.obscureText,
                    keyboardType: widget.inputType,
                    inputFormatters: widget.inputFormatters,
                    textAlign: widget.textAlign,
                    maxLines: widget.maxLines,
                    style: widget.textStyle ?? textStyle.blackText,
                    decoration: widget.decoration,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
