import 'package:dayalimatest/helpers/custom_fonts.dart';
import 'package:flutter/material.dart';

class CategoryListCard extends StatelessWidget {
  CategoryListCard(this.data);
  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            data.img,
            fit: BoxFit.cover,
          ),
          Text(
            data.name,
            style: customNunitoFont(
                fontSize: 14,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
