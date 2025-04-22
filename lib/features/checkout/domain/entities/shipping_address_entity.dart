class ShippingAddressEntity {
  String? name;
  String? address;
  String? phone;
  String? city;
  String? email;
  String? apartmentNumber;
  String? floorNumber;

  ShippingAddressEntity({
    this.name,
    this.address,
    this.phone,
    this.city,
    this.email,
    this.apartmentNumber,
    this.floorNumber,
  });

  @override
  String toString() {
    return '$city $address $apartmentNumber $floorNumber';
  }
}
