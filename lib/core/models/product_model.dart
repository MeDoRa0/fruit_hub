import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/entites/review_entity.dart';
import 'package:fruit_hub/core/helper_functions/get_avarage_rating.dart';
import 'package:fruit_hub/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;

  final bool isFeatured;
  String? imageUrl;
  final int expiryLimit;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avrageRating;
  final num ratingCount = 0;
  final List<ReviewModel> reviews;
  final num sellingCount;

  ProductModel(
      {required this.name,
      required this.code,
      required this.description,
      required this.price,
      required this.avrageRating,
      required this.isFeatured,
      required this.reviews,
      this.imageUrl,
      this.sellingCount = 0,
      required this.expiryLimit,
      this.isOrganic = false,
      required this.numberOfCalories,
      required this.unitAmount});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      avrageRating: getAvrageRating(
        (json['reviews'] as List<dynamic>?)
                ?.map((e) => ReviewModel.fromJson(e) as ReviewEntity)
                .toList() ??
            [],
      ),
      name: json['name'],
      code: json['code'],
      description: json['description'],
      price: json['price'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expiryLimit: json['expiryLimit'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)))
          : [],
      sellingCount: json['sellingCount'],
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      isFeatured: entity.isFeatured,
      imageUrl: entity.imageUrl,
      expiryLimit: entity.expiryLimit,
      isOrganic: entity.isOrganic,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
      reviews: entity.reviews
          .map((review) => ReviewModel.fromEntity(review))
          .toList(),
      avrageRating: entity.avrageRating,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expiryLimit: expiryLimit,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expiryLimit': expiryLimit,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'sellingCount': sellingCount,
    };
  }
}
