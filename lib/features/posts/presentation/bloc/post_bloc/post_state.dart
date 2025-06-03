import 'package:equatable/equatable.dart';
import 'package:task/features/posts/domain/entities/local_post_entity.dart';
import 'package:task/features/posts/domain/entities/post_entity.dart';

abstract class PostState extends Equatable {
  final List<PostEntity>? posts;
  final List<LocalPostEntity>? localPosts;
  final String? message;

  //constructure
  const PostState({this.message, this.posts, this.localPosts});

  @override
  List<Object?> get props => [posts, message, localPosts];
}

//inital state
class PostInitialState extends PostState {
  const PostInitialState() : super(message: null, posts: null);
}

//post loading state
class PostLoadingState extends PostState {
  const PostLoadingState() : super();
}

//post success state
class PostSuccessState extends PostState {
  const PostSuccessState(
    List<PostEntity>? posts,
    List<LocalPostEntity>? localPost,
  ) : super(message: null, posts: posts, localPosts: localPost);
}

class PostCreatedState extends PostState {
  const PostCreatedState(String message) : super(message: message);
}

//post error state
class PostErrorState extends PostState {
  const PostErrorState(String message) : super(message: message, posts: null);
}
