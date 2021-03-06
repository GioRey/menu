import 'package:get/get.dart';
import 'package:menu/src/domain/constants/constants_routes.dart';
import 'package:menu/src/presentation/bindings/home_binding.dart';
import 'package:menu/src/presentation/bindings/main_binding.dart';
import 'package:menu/src/presentation/pages/home_page/home_page.dart';
import 'package:menu/src/presentation/pages/single_page/single_page.dart';

class Routes {
  static final pages = [
    GetPage(
      name: ConstantsRoutes.homePage,
      page: () => HomePage(),
      bindings: [
        MainBinding(),
        HomeBinding(),
      ],
      transition: Transition.fade,
    ),
    GetPage(
      name: ConstantsRoutes.singlePage,
      page: () => SinglePage(),
      bindings: [
        MainBinding(),
      ],
      transition: Transition.fade,
    ),
  ];
}
