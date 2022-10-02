import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/app/app_route.dart';
import 'package:post_app/app/utils/styles/layout_config.dart';
import 'package:post_app/app/utils/styles/theme.dart';
import 'package:post_app/presentation/components/custom_loading.dart';
import 'package:post_app/presentation/components/post_card.dart';
import 'package:post_app/presentation/controllers/home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    layoutConfig.init(context);

    Widget catalogueRenderer = Obx(() {
      return GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 4.5,
        mainAxisSpacing: layoutConfig.defaultMargin,
        padding: EdgeInsets.symmetric(
          vertical: layoutConfig.defaultMargin / 2,
          horizontal: layoutConfig.defaultMargin,
        ),
        // shrinkWrap: true,
        children: controller.posts
            .map(
              (element) => PostCard(post: element),
            )
            .toList(),
      );
    });

    Widget catalogueNotFound = Container(
      width: layoutConfig.safeBlockHorizontal * 100,
      height: layoutConfig.safeAreaVertical * 15,
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
        children: [
          Text(
            "Post Not Found!",
            style: textStyle.blackText.copyWith(fontSize: fontSize.subtitle),
          ),
        ],
      ),
    );

    return GetX(
      init: controller,
      tag: 'HomePage',
      initState: (state) {
        controller.doGetList();
      },
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "All Post",
              style: textStyle.blackText.copyWith(
                fontSize: fontSize.header,
              ),
            ),
            backgroundColor: color.white,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(
                RouteName.createPostScreen,
                arguments: {"parent": controller},
              );
            },
            backgroundColor: color.lightBlue,
            child: Icon(
              Icons.add,
              color: color.white,
            ),
          ),
          body: SafeArea(
            child: Container(
              width: layoutConfig.screenWidth,
              height: layoutConfig.screenHeight,
              color: color.white,
              child: controller.isLoading.value
                  ? const CustomLoading()
                  : (controller.posts.isNotEmpty)
                      ? catalogueRenderer
                      : catalogueNotFound,
            ),
          ),
        );
      },
    );
  }
}
