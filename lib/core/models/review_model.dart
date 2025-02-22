
import 'package:fruit_hub/core/entites/review_entity.dart';

class ReviewModel {
  final String name;
  final String comment;
  final String date;
  final String image;
  final num rating;
  final String reviewDescription;

  ReviewModel({
    required this.name,
    required this.comment,
    required this.date,
    required this.image,
    required this.rating,
    required this.reviewDescription,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) => ReviewModel(
        name: entity.name,
        comment: entity.comment,
        date: entity.date,
        image: entity.image,
        rating: entity.rating,
        reviewDescription: entity.reviewDescription,
      );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        name: json['name'],
        comment: json['comment'],
        date: json['date'],
        image: json['image'],
        rating: json['rating'],
        reviewDescription: json['reviewDescription'],
      );

      ReviewEntity toEntity(){
        return ReviewEntity(
          name: name,
          comment: comment,
          date: date,
          image: image,
          rating: rating,
          reviewDescription: reviewDescription,
        );
      }

  toJson() {
    return {
      'name': name,
      'comment': comment,
      'date': date,
      'image': image,
      'rating': rating,
      'reviewDescription': reviewDescription,
    };
  }
}
