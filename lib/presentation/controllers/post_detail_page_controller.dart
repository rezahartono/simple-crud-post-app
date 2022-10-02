import 'package:get/get.dart';
import 'package:post_app/app/utils/common/app_logger.dart';
import 'package:post_app/data/services/post_service.dart';
import 'package:post_app/domain/entities/post_entity.dart';
import 'package:post_app/presentation/components/custom_alert.dart';

class PostDetailPageController extends GetxController {
  PostDetailPageController();
  final _service = PostService();
  final appState = "".obs;
  final post = PostEntity().obs;
  final isLoading = false.obs;
  final number = 1.obs;
  final postId = Get.arguments["id"];

  doGetDetail({required String state}) async {
    appState.value = state;
    isLoading.value = true;
    try {
      final result = await _service.getDetail(id: postId);

      result.fold((l) {
        logger.safeLog(l);
        isLoading.value = false;
      }, (r) {
        post.value = r;
        isLoading.value = false;
      });

      update();
    } catch (e) {
      logger.safeLog(e);
    }
  }

  doDelete({required String state}) async {
    appState.value = state;
    isLoading.value = true;
    try {
      final result = await _service.delete(id: postId);

      result.fold(
        (l) => alert.error("Something Error!", "Can't be deleted!"),
        (r) {
          Get.back();
          alert.success("Success", r);
        },
      );

      update();
    } catch (e) {
      logger.safeLog(e);
    }
  }
}
