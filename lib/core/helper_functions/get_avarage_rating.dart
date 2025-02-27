import 'package:fruit_hub/core/entites/review_entity.dart';

num getAvrageRating(List<ReviewEntity>reviews) {
  var totalRating = 0.0;
  for (var review in reviews) {
    totalRating += review.rating;
  }
  return totalRating / reviews.length;
}