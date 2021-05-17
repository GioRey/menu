import 'package:menu/src/domain/models/category_model.dart';

abstract class ApiRepositoryinterface {
  Future<void> loadHome();
  Future<List<CategoryModel>> loadMenuJson();
}
