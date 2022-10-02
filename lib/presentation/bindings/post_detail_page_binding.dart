import 'package:get/get.dart';
import 'package:post_app/presentation/controllers/post_detail_page_controller.dart';

class PostDetailPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostDetailPageController>(() => PostDetailPageController());
  }
}
