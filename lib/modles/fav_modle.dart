import 'package:flutter/cupertino.dart';

class FavModle {
  final String image;
  final String restName;
  final String name;
  final int price;
  final int quantity;
  final bool isFavourite;
  final String description;

  FavModle({
    required this.image,
    required this.restName,
    required this.name,
    required this.price,
    required this.quantity,
    required this.isFavourite,
    required this.description,
  });
}
