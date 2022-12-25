import 'package:flutter/cupertino.dart';

class ProductModel {
  String? name;
  String? description;
  String? price;
  String? image;

  ProductModel({
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.image,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['desc'];
    price = json['price'];
    image = json['image'];
  }
}
