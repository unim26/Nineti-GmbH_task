import 'package:equatable/equatable.dart';
import 'package:task/features/posts/domain/entities/reaction_entity.dart';

class PostEntity extends Equatable {
  final int? id;
  final String? title;
  final String? body;
  final List<String>? tags;
  final int? views;
  final int? userId;
  final ReactionEntity? reactions;

  //constructuutre
  const PostEntity({
    this.body,
    this.id,
    this.reactions,
    this.tags,
    this.title,
    this.userId,
    this.views,
  });

  @override
  List<Object?> get props => [body, id, title, views, reactions, tags, userId];
}
