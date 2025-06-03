import 'package:task/features/posts/domain/entities/local_post_entity.dart';

class LocalPostModel extends LocalPostEntity {
  //constructure
  const LocalPostModel({
    required String title,
    required String body,
    required int userId,
  }) : super(body: body, title: title, userId: userId);

  //from json
  factory LocalPostModel.fromJson(Map<String, dynamic> json) => LocalPostModel(
    title: json['title'],
    body: json['body'],
    userId: json['userId'],
  );

  //to json
  Map<String, dynamic> toJson() => {
    'title': title,
    'body': body,
    'userId': userId,
  };
}
