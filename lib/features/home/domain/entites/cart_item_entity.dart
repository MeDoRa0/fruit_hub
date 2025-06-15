import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({
    required this.productEntity,
    this.quantity = 1,
  });

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  double calculateTotalPrice() {
    return (productEntity.price * quantity).toDouble();
  }

  double calculateTotalWeight() {
    return (productEntity.unitAmount * quantity).toDouble();
  }

  @override
  List<Object?> get props => [productEntity];
}
