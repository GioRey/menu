import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu/src/domain/models/category_model.dart';
import 'package:menu/src/presentation/pages/home_page/controller/home_page_controller.dart';

var _controller = Get.put(HomePageController());

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryWidget(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      alignment: Alignment.centerLeft,
      height: _controller.categoryHeight,
      child: Text(
        categoryModel.name,
        style: GoogleFonts.sairaCondensed(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
