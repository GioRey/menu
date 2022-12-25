import 'package:flutter/cupertino.dart';
import 'package:menu/src/domain/models/product_model.dart';

class CategoryModel {
  final String? name;
  final List<ProductModel>? products;

  const CategoryModel({
    @required this.name,
    @required this.products,
  });
}
