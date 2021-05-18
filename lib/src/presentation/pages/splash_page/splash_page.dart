import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu/src/domain/constants/constants.dart';
import 'package:menu/src/domain/constants/constants_colors.dart';
import 'package:menu/src/domain/constants/constants_routes.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var size = Get.size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta < -10) {
            Get.toNamed(
              ConstantsRoutes.homePage,
              preventDuplicates: true,
            );
          }
        },
        child: Stack(
          children: [
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors: [
                      //Color(0XFFA89276),
                      greenColor,
                      blueColor,
                    ],
                  ),
                ),
                /*child: Image.asset(
                  'assets/images/splash/splash.jpg',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),*/
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
              top: size.height * 0.6, //0.05,
            ),
          ],
        ),
      ),
    );
  }
}
