import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu/src/domain/constants/constants_colors.dart';
import 'package:menu/src/domain/models/product_model.dart';
import 'package:menu/src/presentation/pages/home_page/controller/home_page_controller.dart';
import 'package:menu/src/presentation/pages/single_page/single_page.dart';

var _controller = Get.put(HomePageController());

class ItemWidget extends StatelessWidget {
  final ProductModel productModel;
  const ItemWidget(this.productModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 350),
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: SinglePage(
                  productModel: productModel,
                ),
              );
            },
          ),
        );
      },
      child: Container(
        height: _controller.itemHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Card(
              elevation: 6,
              shadowColor: Colors.black54,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Hero(
                      tag: productModel.name,
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: greenColor,
                        backgroundImage: AssetImage(
                          'assets/images/menu/' + productModel.image,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          productModel.name,
                          style: GoogleFonts.sairaCondensed(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: blueColor,
                          ),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            productModel.description,
                            style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w600,
                              fontSize: 11,
                              color: blueColor,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          '\$ ' + productModel.price,
                          style: GoogleFonts.sairaCondensed(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: greenColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
