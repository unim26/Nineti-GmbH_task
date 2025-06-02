import 'package:equatable/equatable.dart';

class ReactionEntity extends Equatable{
  final int? likes;
  final int? dislikes;

  //constructer
  const ReactionEntity({this.dislikes, this.likes});

  @override
  List<Object?> get props => [likes,dislikes];
}
