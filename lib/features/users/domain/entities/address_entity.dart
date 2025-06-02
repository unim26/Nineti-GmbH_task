import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable{
  final String? address;
  final String? city;
  final String? state;
  final String? country;

  const AddressEntity({this.address, this.city, this.country, this.state});

  @override
  List<Object?> get props => [
    address,city,country,state,
  ];
}
