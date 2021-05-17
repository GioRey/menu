import 'package:get/get.dart';
import 'package:menu/src/domain/repository/api_repository_interface.dart';
import 'package:menu/src/state_management/data/api_repository_implementation.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiRepositoryinterface>(
      () => ApiRepositoryImplementation(),
    );
  }
}
