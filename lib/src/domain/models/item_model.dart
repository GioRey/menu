import 'package:menu/src/domain/models/category_model.dart';
import 'package:menu/src/domain/models/product_model.dart';

class ItemModel {
  const ItemModel({
    this.categoryModel,
    this.productModel,
  });

  final CategoryModel categoryModel;
  final ProductModel productModel;

  bool get isCategory => categoryModel != null;
}
