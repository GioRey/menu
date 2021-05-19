import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu/src/domain/constants/constants.dart';
import 'package:menu/src/domain/constants/constants_colors.dart';
import 'package:menu/src/domain/models/product_model.dart';

const imageRadius = 90.0;

class SinglePage extends StatefulWidget {
  final ProductModel productModel;
  const SinglePage({Key key, this.productModel}) : super(key: key);

  @override
  _SinglePageState createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: Hero(
          tag: 'header',
          child: Material(
            color: Colors.transparent,
            child: FittedBox(
              child: Text(
                Constants.appName,
                style: GoogleFonts.sairaCondensed(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: imageRadius / 1.3,
                    left: -80.0,
                    right: -80.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            greenColor,
                            blueColor,
                          ],
                        ),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(750.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Hero(
                        tag: widget.productModel.name,
                        child: CircleAvatar(
                          radius: imageRadius,
                          child: CircleAvatar(
                            radius: imageRadius - 5,
                            backgroundImage: AssetImage(
                              'assets/images/menu/' + widget.productModel.image,
                            ),
                          ),
                          backgroundColor: Colors.white24,
                          /*backgroundImage: AssetImage(
                            'assets/images/menu/' + productModel.image,
                          ),*/
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        widget.productModel.name,
                        style: GoogleFonts.sairaCondensed(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.cyan[50],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.productModel.description,
                            style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: blueColor,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.cyan[100],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.cyan[100],
                              blurRadius: 100.0,
                              offset: Offset(
                                0.0,
                                0.75,
                              ),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '\$${widget.productModel.price}',
                            style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: greenColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
