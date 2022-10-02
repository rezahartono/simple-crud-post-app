import 'package:flutter/material.dart';
import 'package:post_app/app/utils/styles/layout_config.dart';
import 'package:post_app/app/utils/styles/theme.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: color.black,
            strokeWidth: 2,
          ),
          SizedBox(
            width: layoutConfig.defaultMargin,
          ),
          Text(
            "Loading...",
            style: textStyle.blackText.copyWith(
              fontSize: fontSize.subtitle,
            ),
          ),
        ],
      ),
    );
  }
}
