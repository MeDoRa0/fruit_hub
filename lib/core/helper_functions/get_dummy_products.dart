import 'package:fruit_hub/core/entites/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    productId: "01",
    code: "1",
    name: "Apple",
    price: 10,
    description: "A red apple",
    imageUrl: null,
    isOrganic: true,
    isFeatured: true,
    numberOfCalories: 100,
    unitAmount: 1,
    reviews: [],
    expiryLimit: 5,
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
