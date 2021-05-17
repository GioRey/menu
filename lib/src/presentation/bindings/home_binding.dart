import 'package:get/get.dart';
import 'package:menu/src/presentation/pages/home_page/controller/home_page_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomePageController(
        apiRepositoryinterface: Get.find(),
      ),
    );
  }
}
