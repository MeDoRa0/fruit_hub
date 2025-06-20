import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entites/review_entity.dart';

// ignore: must_be_immutable
class ProductEntity extends Equatable {
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
  final num avrageRating = 0;
  final num ratingCount = 0;
  final List<ReviewEntity> reviews;

  ProductEntity(
      {required this.name,
      required this.code,
      required this.description,
      required this.price,
      required this.reviews,
      this.isOrganic = false,
      required this.isFeatured,
      this.imageUrl,
      required this.expiryLimit,
      required this.numberOfCalories,
      required this.unitAmount});
      
        @override
        // TODO: implement props
        List<Object?> get props => throw UnimplementedError();

  
}