import 'package:task/features/todos/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  //constructure
  const TodoModel({
    required int id,
    required String todo,
    required bool isCompleted,
    required int userId,
  }) : super(id: id, isCompleted: isCompleted, todo: todo, userId: userId);

  //fromjson method
  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
    id: json['id'],
    todo: json['todo'],
    isCompleted: json['completed'],
    userId: json['userId'],
  );
}
