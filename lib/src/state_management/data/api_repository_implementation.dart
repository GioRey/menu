import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:menu/src/domain/constants/constants_menu.dart';
import 'package:menu/src/domain/models/category_model.dart';
import 'package:menu/src/domain/models/product_model.dart';
import 'package:menu/src/domain/repository/api_repository_interface.dart';

class ApiRepositoryImplementation extends ApiRepositoryinterface {
  @override
  Future<List<CategoryModel>> loadMenuJson() async {
    String data = await rootBundle.loadString('assets/data/menu.json');
    List<CategoryModel> categoryModel = [];
    var loadData = json.decode(data);
    var resp = loadData['prods'] as List;
    List<ProductModel> products = [];

    for (var i = 0; i < resp.length; i++) {
      products = [];
      var cat = resp[i][categoriesNames[i]] as List;

      products =
          cat.map<ProductModel>((e) => ProductModel.fromJson(e)).toList();
      categoryModel
          .add(CategoryModel(name: categoriesNames[i], products: products));
    }

    return categoryModel;
  }
}
