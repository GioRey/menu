import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu/src/domain/constants/constants.dart';
import 'package:menu/src/domain/constants/constants_colors.dart';
import 'package:menu/src/domain/models/category_model.dart';
import 'package:menu/src/presentation/pages/home_page/controller/home_page_controller.dart';
import 'package:menu/src/presentation/pages/home_page/widgets/category_widget.dart';
import 'package:menu/src/presentation/pages/home_page/widgets/item_widget.dart';
import 'package:menu/src/presentation/pages/home_page/widgets/tab_widget.dart';
import 'package:menu/src/presentation/widgets/loading_widget.dart';

var _homeController = Get.put(HomePageController());

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<CategoryModel> data;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      loadMenu(this, data);
    });
    super.initState();
  }

  void loadMenu(TickerProvider ticker, data) async {
    data = await _homeController.apiRepositoryinterface.loadMenuJson();
    setState(() {
      _homeController.init(ticker: this, allcategories: data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 83,
              child: Card(
                color: backgroundColor,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: 'header',
                        child: Material(
                          color: Colors.transparent,
                          child: FittedBox(
                            child: Text(
                              Constants.appName,
                              style: GoogleFonts.sairaCondensed(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: greenColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              child: Obx(
                () {
                  if (_homeController.isLoading.value) {
                    return ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => loadingWidget(
                          height: 60.0, width: 150.0, radius: 50.0),
                    );
                  } else {
                    final index = _homeController.isSelectedTabCategory;
                    // ignore: unrelated_type_equality_checks
                    if (index != 20) {}
                    return TabBar(
                      controller: _homeController.tabsController,
                      onTap: _homeController.onTabSelected,
                      isScrollable: true,
                      indicatorWeight: 0.1,
                      tabs: _homeController.tabsCategory
                          .map((e) => TabWidget(e))
                          .toList(),
                    );
                  }
                },
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  if (_homeController.isLoading.value) {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => loadingWidget(
                          height: _homeController.itemHeight, radius: 15.0),
                    );
                  } else {
                    return ListView.builder(
                      controller: _homeController.scrollController,
                      itemCount: _homeController.items.length,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      itemBuilder: (context, index) {
                        final item = _homeController.items[index];
                        if (item.isCategory) {
                          return CategoryWidget(item.categoryModel);
                        } else {
                          return ItemWidget(item.productModel);
                        }
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
