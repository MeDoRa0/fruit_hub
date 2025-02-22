import 'dart:io';

import 'package:fruit_hub/core/entites/review_entity.dart';


class ProductInputEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expiryLimit;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avrageRating = 0;
  final num ratingCount = 0;
  final List<ReviewEntity> reviews;

  ProductInputEntity(
      {required this.name,
      required this.code,
      required this.description,
      required this.price,
      required this.reviews,
      required this.image,
      this.isOrganic = false,
      required this.isFeatured,
      this.imageUrl,
      required this.expiryLimit,
      required this.numberOfCalories,
      required this.unitAmount});
}
