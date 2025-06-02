import 'package:task/features/users/data/models/address_model.dart';
import 'package:task/features/users/data/models/company_model.dart';
import 'package:task/features/users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required int id,
    required String firstName,
    required String lastName,
    required int age,
    required String gender,
    required String email,
    required String phone,
    required String username,
    required String password,
    required String image,
    required String bloodGroup,
    required AddressModel address,
    required CompanyModel company,
    required String role,
  }) : super(
         address: address,
         age: age,
         bloodGroup: bloodGroup,
         company: company,
         email: email,
         firstName: firstName,
         gender: gender,
         id: id,
         image: image,
         lastName: lastName,
         password: password,
         phone: phone,
         role: role,
         username: username,
       );

  //fromjson methos
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    age: json['age'],
    gender: json['gender'],
    email: json['email'],
    phone: json['phone'],
    username: json['username'],
    password: json['password'],
    image: json['image'],
    bloodGroup: json['bloodGroup'],
    address: json['address'],
    company: json['company'],
    role: json['role'],
  );
}
