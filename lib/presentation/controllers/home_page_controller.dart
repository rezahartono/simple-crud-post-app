import 'package:get/get.dart';
import 'package:post_app/app/utils/common/app_logger.dart';
import 'package:post_app/data/services/post_service.dart';
import 'package:post_app/domain/entities/post_entity.dart';

class HomePageController extends GetxController {
  HomePageController();
  final _service = PostService();
  final posts = <PostEntity>[].obs;
  final isLoading = false.obs;
  final number = 1.obs;

  doGetList() async {
    isLoading.value = true;
    try {
      final result = await _service.getList();

      result.fold((l) {
        logger.safeLog(l);
        isLoading.value = false;
      }, (r) {
        posts.value = r;
        isLoading.value = false;
      });

      update();
    } catch (e) {
      logger.safeLog(e);
    }
  }
}
