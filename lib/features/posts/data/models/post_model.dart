import 'package:task/features/posts/data/models/reaction_model.dart';
import 'package:task/features/posts/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  //constructure
  const PostModel({
    required int id,
    required String title,
    required String body,
    required List<String> tags,
    required int views,
    required int userId,
    required ReactionModel reactions,
  }) : super(
         body: body,
         id: id,
         reactions: reactions,
         tags: tags,
         title: title,
         userId: userId,
         views: views,
       );

  //fromjson method
  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json['id'],
    title: json['title'],
    body: json['body'],
    tags: json['tags'],
    views: json['views'],
    userId: json['userId'],
    reactions: json['reactions'],
  );
}
