import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu/src/domain/constants/constants_colors.dart';
import 'package:menu/src/domain/models/tab_category.dart';

class TabWidget extends StatelessWidget {
  TabWidget(this.tabCategory);
  final TabCategory? tabCategory;

  @override
  Widget build(BuildContext context) {
    final selected = tabCategory!.selected;
    return Opacity(
      opacity: selected! ? 1 : 0.5,
      child: Container(
        child: Card(
          elevation: selected ? 6 : 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '${tabCategory!.categoryModel!.name}',
              style: GoogleFonts.sairaCondensed(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: selected ? greenColor : blueColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
