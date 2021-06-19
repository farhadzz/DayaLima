import 'package:dayalimatest/components/custom_app_bar.dart';
import 'package:dayalimatest/helpers/custom_fonts.dart';
import 'package:flutter/material.dart';

class CategoryDetail extends StatelessWidget {
  CategoryDetail(this.data);

  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarIcon(
        icon: Icons.arrow_back,
        iconColor: Colors.black,
        iconSize: 24,
        centerTitle: true,
        elevation: 0,
        title: "Daya Lima",
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name,
              style: customNunitoFont(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  data.img,
                )
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              data.desc,
              style: customNunitoFont(
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
