import 'package:flutter/cupertino.dart';
import 'package:menu/src/domain/models/category_model.dart';

class TabCategory {
  TabCategory({
    @required this.categoryModel,
    @required this.selected,
    @required this.offsetFrom,
    @required this.offsetTo,
  });

  TabCategory copyWith(bool selected) => TabCategory(
        categoryModel: categoryModel,
        selected: selected,
        offsetFrom: offsetFrom,
        offsetTo: offsetTo,
      );

  CategoryModel? categoryModel;
  bool? selected;
  double? offsetFrom;
  double? offsetTo;
}
