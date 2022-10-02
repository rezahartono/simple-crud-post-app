import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/app/utils/common/app_logger.dart';
import 'package:post_app/data/services/post_service.dart';
import 'package:post_app/domain/entities/post_entity.dart';
import 'package:post_app/presentation/components/custom_alert.dart';

class UpdatePostPageController extends GetxController {
  UpdatePostPageController();
  final _service = PostService();
  final appState = "".obs;
  final post = PostEntity().obs;
  final isLoading = false.obs;
  final number = 1.obs;
  final postId = Get.arguments["id"];
  final postTitleController = TextEditingController();
  final postBodyController = TextEditingController();

  doGetDetail({required String state}) async {
    appState.value = state;
    isLoading.value = true;
    try {
      final result = await _service.getDetail(id: postId);

      result.fold(
        (l) {
          logger.safeLog(l);
          isLoading.value = false;
        },
        (r) {
          post.value = r;
          postTitleController.text = r.title ?? "";
          postBodyController.text = r.body ?? "";
          isLoading.value = false;
        },
      );

      update();
    } catch (e) {
      logger.safeLog(e);
    }
  }

  doUpdate({required String state}) async {
    appState.value = state;
    isLoading.value = true;
    try {
      final result = await _service.update(
        request: PostEntity(
          id: postId,
          title: postTitleController.text,
          body: postBodyController.text,
          userId: post.value.userId,
        ),
      );

      result.fold(
        (l) {
          logger.safeLog(l);
          isLoading.value = false;
        },
        (r) {
          post.value = r;
          postTitleController.text = r.title ?? "";
          postBodyController.text = r.body ?? "";
          isLoading.value = false;
          alert.success("Success", "Record has been updated!");
        },
      );

      update();
    } catch (e) {
      logger.safeLog(e);
    }
  }
}
