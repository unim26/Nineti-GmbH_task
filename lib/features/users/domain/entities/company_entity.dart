import 'package:equatable/equatable.dart';
import 'package:task/features/users/domain/entities/address_entity.dart';

class CompanyEntity extends Equatable {
  final String? department;
  final String? name;
  final String? title;
  final AddressEntity? address;

  const CompanyEntity({this.address, this.department, this.name, this.title});

  @override
  List<Object?> get props => [address, department, name, title];
}
