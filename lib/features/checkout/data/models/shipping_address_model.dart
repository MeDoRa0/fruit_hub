import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? address;
  String? phone;
  String? city;
  String? email;
  String? apartmentNumber;
  String? floorNumber;

  ShippingAddressModel({
    this.name,
    this.address,
    this.phone,
    this.city,
    this.email,
    this.apartmentNumber,
    this.floorNumber,
  });
  factory ShippingAddressModel.fromEntity(
      ShippingAddressEntity shippingAddressEntity) {
    return ShippingAddressModel(
      name: shippingAddressEntity.name,
      address: shippingAddressEntity.address,
      phone: shippingAddressEntity.phone,
      city: shippingAddressEntity.city,
      email: shippingAddressEntity.email,
      apartmentNumber: shippingAddressEntity.apartmentNumber,
      floorNumber: shippingAddressEntity.floorNumber,
    );
  }

  @override
  String toString() {
    return '$city $address $apartmentNumber $floorNumber';
  }

  toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'city': city,
      'email': email,
      'apartmentNumber': apartmentNumber,
      'floorNumber': floorNumber,
    };
  }
}
