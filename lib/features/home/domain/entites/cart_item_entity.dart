import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';

class CartItemEntity  extends Equatable {
  final ProductEntity productEntity;
   int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }
  num calculateTotalWeight() {
    return productEntity.unitAmount* quantity;
  }
  void incrementQuantity() {
    quantity++;
  }
  void decrementQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }
  
  @override
  
  List<Object?> get props => [productEntity];

  
}