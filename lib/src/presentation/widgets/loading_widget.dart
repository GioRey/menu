import 'package:flutter/material.dart';
import 'package:menu/src/domain/constants/constants_colors.dart';
import 'package:shimmer/shimmer.dart';

Widget loadingWidget(
        {@required double height, double width, @required double radius}) =>
    Container(
      height: height,
      width: width,
      child: Shimmer.fromColors(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              radius,
            ),
          ),
        ),
        baseColor: greenColor,
        highlightColor: Colors.white70,
      ),
    );
