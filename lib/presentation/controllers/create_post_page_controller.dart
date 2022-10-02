import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/app/utils/common/app_logger.dart';
import 'package:post_app/data/models/create_post_model.dart';
import 'package:post_app/data/services/post_service.dart';
import 'package:post_app/domain/entities/post_entity.dart';
import 'package:post_app/presentation/components/custom_alert.dart';
import 'package:post_app/presentation/controllers/home_page_controller.dart';

class CreatePostPageController extends GetxController {
  CreatePostPageController();
  final _service = PostService();
  final appState = "".obs;
  final isLoading = false.obs;
  final postTitleController = TextEditingController();
  final postBodyController = TextEditingController();

  doCreate({required String state}) async {
    appState.value = state;
    isLoading.value = true;
    try {
      final result = await _service.create(
        request: CreatePostModel(
          title: postTitleController.text,
          body: postBodyController.text,
          userId: 1,
        ),
      );

      result.fold(
        (l) {
          logger.safeLog(l);
          isLoading.value = false;
        },
        (r) {
          final parent = Get.arguments["parent"];
          postTitleController.text = r.title ?? "";
          postBodyController.text = r.body ?? "";
          parent.posts.insert(0, r);
          isLoading.value = false;
          Get.back();
          alert.success(
              "Success", "Post with title ${r.title ?? ''} has been created!");
        },
      );

      update();
    } catch (e) {
      logger.safeLog(e);
    }
  }
}
