import 'package:fruit_hub/core/entites/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    code: "1",
    name: "Apple",
    price: 10,
    description: "A red apple",
    imageUrl:
        "https://th.bing.com/th/id/OIP.gxVIhxEKV2L4dkBjwptXjwHaHa?rs=1&pid=ImgDetMain",
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
