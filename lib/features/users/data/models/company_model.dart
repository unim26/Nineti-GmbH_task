import 'package:task/features/users/data/models/address_model.dart';
import 'package:task/features/users/domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  const CompanyModel({
    required String department,
    required String name,
    required String title,
    required AddressModel address,
  }) : super(
         address: address,
         department: department,
         name: name,
         title: title,
       );

  //fromjson method
  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
    department: json['department'],
    name: json['name'],
    title: json['title'],
    address: json['address'],
  );
}
