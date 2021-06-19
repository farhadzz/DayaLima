import 'package:dayalimatest/controllers/category_controller.dart';
import 'package:dayalimatest/helpers/custom_fonts.dart';
import 'package:dayalimatest/screens/category_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {

  final CategoryController category = Get.put(CategoryController());

  text(String val) {
    if(val == 'company') {
      return 'Company';
    } else if(val == 'community') {
      return 'Community';
    } else if(val == 'educational') {
      return 'Educational';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
        builder: (_) {
          return category.isLoad
              ? Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Your Category",
                  style: customNunitoFont(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 14.0,
                ),
                Column(
                    children: List.generate(category.data.data.length, (i) {
                      var list = category.data.data[i];
                      return InkWell(
                        onTap: () {
                          Get.to(CategoryList(list.name));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 193.0,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 2),
                                        spreadRadius: 0,
                                        blurRadius: 16)
                                  ],
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage(list.img),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Text(
                                    text(list.name),
                                    style: customNunitoFont(fontSize: 15.0, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                ),
              ],
            ),
          )
              : Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
    );
  }
}
