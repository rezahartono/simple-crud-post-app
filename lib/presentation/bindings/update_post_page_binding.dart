import 'package:get/get.dart';
import 'package:post_app/presentation/controllers/update_post_page_controller.dart';

class UpdatePostPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatePostPageController>(() => UpdatePostPageController());
  }
}
