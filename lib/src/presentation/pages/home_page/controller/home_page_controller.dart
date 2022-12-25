import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu/src/domain/models/category_model.dart';
import 'package:menu/src/domain/models/item_model.dart';
import 'package:menu/src/domain/models/tab_category.dart';
import 'package:menu/src/domain/repository/api_repository_interface.dart';

class HomePageController extends GetxController {
  late ApiRepositoryinterface apiRepositoryinterface;
  HomePageController({required this.apiRepositoryinterface});

  late TabController tabsController;
  ScrollController scrollController = ScrollController();
  RxInt isSelectedTabCategory = 0.obs;
  bool _listen = true;
  RxBool isLoading = true.obs;

  var categoryHeight = 55.0;
  var itemHeight = 110.0;

  List<TabCategory> tabsCategory = [];
  List<ItemModel> items = [];

  List<CategoryModel> allCategories = [];

  void init(
      {required TickerProvider ticker,
      required List<CategoryModel> allcategories}) async {
    allCategories = allcategories;

    tabsController = TabController(length: allCategories.length, vsync: ticker);

    double offsetFrom = 0.0;
    double offsetTo = 0.0;

    for (int i = 0; i < allCategories.length; i++) {
      final category = allCategories[i];

      if (i > 0) {
        offsetFrom += allCategories[i - 1].products!.length * itemHeight;
      }

      if (i < allCategories.length - 1) {
        offsetTo =
            offsetFrom + allCategories[i + 1].products!.length * itemHeight;
      } else {
        offsetTo = double.infinity;
      }

      tabsCategory.add(
        TabCategory(
          categoryModel: category,
          selected: (i == 0),
          offsetFrom: categoryHeight * i + offsetFrom,
          offsetTo: offsetTo,
        ),
      );
      items.add(ItemModel(categoryModel: category));
      for (var j = 0; j < category.products!.length; j++) {
        final product = category.products![j];
        items.add(ItemModel(productModel: product));
      }
    }
    scrollController.addListener(_onScrollListener);
    Future.delayed(const Duration(seconds: 2), () => isLoading(false));
  }

  void _onScrollListener() {
    if (_listen) {
      for (int i = 0; i < tabsCategory.length; i++) {
        final tab = tabsCategory[i];

        //print('SCROLL --> ${scrollController.offset}');
        if (scrollController.offset >= tab.offsetFrom! &&
            i > isSelectedTabCategory.value &&
            !tab.selected!) {
          onTabSelected(i, animationRequired: false);
          tabsController.animateTo(isSelectedTabCategory.value);
          break;
        }
        if (scrollController.offset <= tab.offsetFrom! &&
            i < isSelectedTabCategory.value &&
            !tab.selected!) {
          onTabSelected(i, animationRequired: false);
          tabsController.animateTo(isSelectedTabCategory.value);
        }
      }
    }
  }

  void onTabSelected(int index, {bool animationRequired = true}) async {
    final selected = tabsCategory[index];
    for (int i = 0; i < tabsCategory.length; i++) {
      final condition = selected == tabsCategory[i];
      tabsCategory[i] = tabsCategory[i].copyWith(condition);
    }
    isSelectedTabCategory(index);

    if (animationRequired) {
      _listen = false;
      await scrollController.animateTo(
        selected.offsetFrom!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
      _listen = true;
    }
  }

  @override
  void onClose() {
    tabsController.dispose();
    scrollController.removeListener(_onScrollListener);
    scrollController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    tabsController.dispose();
    scrollController.removeListener(_onScrollListener);
    scrollController.dispose();
    super.dispose();
  }
}
