import 'package:get/get.dart';
import 'package:post_app/presentation/controllers/create_post_page_controller.dart';

class CreatePostPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePostPageController>(() => CreatePostPageController());
  }
}
