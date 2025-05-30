import 'package:fruit_hub/features/home/domain/entites/favorite_entity.dart';

class FavoriteModel {
  final String productId;
  final String userId;

  FavoriteModel({
    required this.productId,
    required this.userId,
  });
  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      productId: json['productId'] as String,
      userId: json['uId'] as String,
    );
  }

  factory FavoriteModel.fromEntity(FavoriteEntity favoriteEntity) {
    return FavoriteModel(
      productId: favoriteEntity.productId,
      userId: favoriteEntity.userId,
    );
  }

 Map<String, dynamic>  toJson() => {
        'productId': productId,
        'uId': userId,
      };

  toEntity() => FavoriteEntity(
        productId: productId,
        userId: userId,

      );
}
