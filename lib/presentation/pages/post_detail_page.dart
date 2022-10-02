import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/app/app_route.dart';
import 'package:post_app/app/utils/common/app_logger.dart';
import 'package:post_app/app/utils/constants/string_constant.dart';
import 'package:post_app/app/utils/styles/layout_config.dart';
import 'package:post_app/app/utils/styles/theme.dart';
import 'package:post_app/presentation/components/custom_alert.dart';
import 'package:post_app/presentation/components/custom_button.dart';
import 'package:post_app/presentation/components/custom_loading.dart';
import 'package:post_app/presentation/controllers/post_detail_page_controller.dart';

class PostDetailPage extends GetView<PostDetailPageController> {
  const PostDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    layoutConfig.init(context);

    Widget catalogueRenderer = Obx(() {
      return ListView(
        padding: EdgeInsets.symmetric(
          vertical: layoutConfig.defaultMargin,
          horizontal: layoutConfig.defaultMargin,
        ),
        children: [
          Text(
            controller.post.value.title ?? "",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: textStyle.blackText.copyWith(
              fontSize: fontSize.header,
              fontWeight: fontWeight.semiBold,
            ),
          ),
          SizedBox(
            height: layoutConfig.defaultMargin,
          ),
          Text(
            controller.post.value.body ?? "",
            textAlign: TextAlign.justify,
            softWrap: true,
            style: textStyle.blackText.copyWith(
              fontSize: fontSize.body,
            ),
          )
        ],
      );
    });

    Widget actionButtonBuilder = Padding(
      padding: EdgeInsets.all(layoutConfig.defaultMargin),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () {
                Get.toNamed(
                  RouteName.updatePostScreen,
                  arguments: {"id": controller.postId},
                );
              },
              style: buttonStyle.primary,
              label: Text(
                "EDIT",
                style: textStyle.whiteText,
              ),
              height: layoutConfig.safeBlockVertical * 6.5,
            ),
          ),
          SizedBox(
            width: layoutConfig.defaultMargin,
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                alert.confirmation(
                  "Are you sure to delete this data?",
                  () {
                    Get.back();
                    controller.doDelete(state: appState.onDelete);
                  },
                );
              },
              style: buttonStyle.danger,
              label: Text(
                "DELETE",
                style: textStyle.whiteText,
              ),
              height: layoutConfig.safeBlockVertical * 6.5,
            ),
          ),
        ],
      ),
    );

    return GetX(
      init: controller,
      tag: 'PostDetailPage',
      initState: (state) {
        controller.doGetDetail(state: appState.firstState);
      },
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Post Detail",
              style: textStyle.blackText.copyWith(
                fontSize: fontSize.header,
              ),
            ),
            backgroundColor: color.white,
          ),
          body: SafeArea(
            child: Container(
              width: layoutConfig.screenWidth,
              height: layoutConfig.screenHeight,
              color: color.white,
              child: controller.isLoading.value &&
                      (controller.appState.value == appState.firstState)
                  ? const CustomLoading()
                  : Column(
                      children: [
                        Expanded(child: catalogueRenderer),
                        actionButtonBuilder,
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
