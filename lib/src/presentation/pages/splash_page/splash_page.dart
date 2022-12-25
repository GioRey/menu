import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu/src/domain/constants/constants.dart';
import 'package:menu/src/domain/constants/constants_colors.dart';
import 'package:menu/src/domain/constants/constants_routes.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var size = Get.size;

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.offNamed(
          ConstantsRoutes.homePage,
          preventDuplicates: true,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {},
        child: Stack(
          children: [
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [
                      greenColor,
                      blueColor,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              child: Hero(
                tag: 'header',
                child: Material(
                  color: Colors.transparent,
                  child: FittedBox(
                    child: Text(
                      Constants.appName,
                      style: GoogleFonts.sairaCondensed(
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              left: size.width * 0.05,
              right: size.width * 0.05,
              top: size.height * 0.6,
            ),
          ],
        ),
      ),
    );
  }
}
