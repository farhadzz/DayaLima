// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.data,
  });

  List<Datum> data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.img,
    this.listData,
  });

  int id;
  String name;
  String img;
  String listData;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    img: json["img"],
    listData: json["listData"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "img": img,
    "listData": listData,
  };
}
