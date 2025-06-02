import 'package:task/features/users/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    required String address,
    required String city,
    required String state,
    required String country,
  }) : super(address: address, city: city, country: country, state: state);

  //fromJson method
  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    address: json['address'],
    city: json['city'],
    state: json['state'],
    country: json['country'],
  );
}
