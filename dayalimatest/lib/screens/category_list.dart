import 'package:dayalimatest/components/category_list_card.dart';
import 'package:dayalimatest/components/custom_app_bar.dart';
import 'package:dayalimatest/controllers/category_controller.dart';
import 'package:dayalimatest/screens/category_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryList extends StatefulWidget {
  CategoryList(this.type);
  final type;

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  CategoryController category = Get.find();

  Future<void> fetchData() async {
    await category.fetchList(widget.type);
  }

  @override
  void dispose() {
    category.disposeList();
    super.dispose();
  }

  List<Widget> listData(BuildContext context) {
    var output = <Widget>[];
    for(var i = 0; i < category.dataList.data.length; i++) {
      var data = category.dataList.data[i];
      output.add(
        InkWell(
          onTap: () {
            Get.to(CategoryDetail(data));
          },
          child: CategoryListCard(data),
        ),
      );
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          return GetBuilder<CategoryController>(
              builder: (_) {
                return category.isLoadList
                    ? Scaffold(
                  appBar: CustomAppBarIcon(
                    icon: Icons.arrow_back,
                    iconColor: Colors.black,
                    iconSize: 24,
                    centerTitle: true,
                    elevation: 0,
                    title: "Daya Lima",
                  ),
                  body: Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 50,
                        padding: EdgeInsets.all(16),
                        scrollDirection: Axis.vertical,
                        childAspectRatio: (1 / 1),
                        children: listData(context)
                    ),
                  ),
                )
                    : Container(
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
          );
        }
    );
  }
}
