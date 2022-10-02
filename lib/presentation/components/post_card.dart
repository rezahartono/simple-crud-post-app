import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/app/app_route.dart';
import 'package:post_app/app/utils/common/app_common.dart';

import 'package:post_app/app/utils/styles/layout_config.dart';
import 'package:post_app/app/utils/styles/theme.dart';
import 'package:post_app/domain/entities/post_entity.dart';

class PostCard extends StatelessWidget {
  final PostEntity post;
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: layoutConfig.safeBlockHorizontal * 100,
      padding: EdgeInsets.symmetric(
        horizontal: layoutConfig.defaultMargin,
      ),
      decoration: BoxDecoration(
        color: color.white,
        borderRadius: BorderRadius.circular(layoutConfig.defaultMargin / 2),
        boxShadow: boxShadow.small(
          color: color.black.withOpacity(0.1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            common.setMaxLength(post.title ?? "", 20),
            style: textStyle.blackText.copyWith(fontSize: fontSize.subtitle),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(
                RouteName.postDetailScreen,
                arguments: {
                  "id": post.id,
                },
              );
            },
            child: Row(
              children: [
                Text(
                  "Read Post",
                  style: textStyle.blackText.copyWith(
                    fontSize: fontSize.subtitle,
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: color.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
