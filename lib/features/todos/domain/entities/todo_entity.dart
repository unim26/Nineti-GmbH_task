import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable{
  final int? id;
  final String? todo;
  final bool? isCompleted;
  final int? userId;

  //constructure
  const TodoEntity({this.id, this.isCompleted, this.todo, this.userId});

  @override
  List<Object?> get props => [id,todo,isCompleted,userId];
}
