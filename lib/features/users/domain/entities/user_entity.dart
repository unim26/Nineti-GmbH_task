import 'package:equatable/equatable.dart';
import 'package:task/features/users/domain/entities/address_entity.dart';
import 'package:task/features/users/domain/entities/company_entity.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final int? age;
  final String? gender;
  final String? email;
  final String? phone;
  final String? username;
  final String? password;
  final String? image;
  final String? bloodGroup;
  final AddressEntity? address;
  final CompanyEntity? company;
  final String? role;

  //constructure
  const UserEntity({
    this.address,
    this.age,
    this.bloodGroup,
    this.company,
    this.email,
    this.firstName,
    this.gender,
    this.id,
    this.image,
    this.lastName,
    this.password,
    this.phone,
    this.role,
    this.username,
  });

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    age,
    gender,
    email,
    phone,
    username,
    password,
    image,
    bloodGroup,
    address,
    company,
    role,
  ];
}
