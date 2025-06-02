import 'package:task/features/posts/domain/entities/reaction_entity.dart';

class ReactionModel extends ReactionEntity {
  //constructure
  const ReactionModel({required int likes, required int dislikes})
    : super(dislikes: dislikes, likes: likes);

  //fromjson method
  factory ReactionModel.fromJson(Map<String, dynamic> json) =>
      ReactionModel(likes: json['likes'], dislikes: json['dislikes']);
}
