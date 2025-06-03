import 'package:equatable/equatable.dart';


class LocalPostEntity extends Equatable {
  final String? title;
  final String? body;
  final int? userId;

  //constructure
  const LocalPostEntity({this.body, this.title, this.userId});

  @override
  List<Object?> get props => [body,title,userId];
}
