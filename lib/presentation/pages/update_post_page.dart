import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/app/utils/constants/string_constant.dart';
import 'package:post_app/app/utils/styles/layout_config.dart';
import 'package:post_app/app/utils/styles/theme.dart';
import 'package:post_app/presentation/components/custom_alert.dart';
import 'package:post_app/presentation/components/custom_button.dart';
import 'package:post_app/presentation/components/custom_loading.dart';
import 'package:post_app/presentation/components/custom_text_input.dart';
import 'package:post_app/presentation/controllers/update_post_page_controller.dart';

class UpdatePostPage extends GetView<UpdatePostPageController> {
  const UpdatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    layoutConfig.init(context);

    Widget catalogueRenderer = ListView(
      padding: EdgeInsets.symmetric(
        vertical: layoutConfig.defaultMargin,
        horizontal: layoutConfig.defaultMargin,
      ),
      children: [
        CustomTextInput(
          controller: controller.postTitleController,
          border: Border.all(
            width: 1,
            color: color.black,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Title",
            hintStyle: textStyle.greyText,
          ),
          label: Text(
            "Title",
            style: textStyle.blackText.copyWith(
              fontSize: fontSize.small,
            ),
          ),
          borderRadius: BorderRadius.circular(layoutConfig.defaultMargin / 2),
        ),
        CustomTextInput(
          controller: controller.postBodyController,
          border: Border.all(
            width: 1,
            color: color.black,
          ),
          maxLines: 6,
          height: layoutConfig.safeBlockVertical * 15,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Body",
            hintStyle: textStyle.greyText,
          ),
          label: Text(
            "Body",
            style: textStyle.blackText.copyWith(
              fontSize: fontSize.small,
            ),
          ),
          borderRadius: BorderRadius.circular(layoutConfig.defaultMargin / 2),
        ),
      ],
    );

    Widget actionButtonBuilder = Padding(
      padding: EdgeInsets.all(layoutConfig.defaultMargin),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () {
                alert.confirmation(
                  "Are you sure to update this data?",
                  () {
                    Get.back();
                    controller.doUpdate(state: appState.onUpdate);
                  },
                );
              },
              style: buttonStyle.primary,
              label: Text(
                "UPDATE",
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
      tag: 'UpdatePostPage',
      initState: (state) {
        controller.doGetDetail(state: appState.firstState);
      },
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Update Post",
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
