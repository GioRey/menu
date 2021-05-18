import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:menu/src/domain/constants/constants.dart';
import 'package:menu/src/domain/constants/constants_colors.dart';
import 'package:menu/src/domain/constants/constants_routes.dart';
import 'package:menu/src/presentation/bindings/main_binding.dart';
import 'package:menu/src/presentation/routes/routes.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: greenColor),
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.black45),
        brightness: Brightness.light,
        accentColor: greenColor,
      ),
      getPages: Routes.pages,
      initialRoute: ConstantsRoutes.splashPage,
      initialBinding: MainBinding(),
    );
  }
}
