import 'package:equatable/equatable.dart';
import 'package:task/features/todos/domain/entities/todo_entity.dart';

abstract class TodoState extends Equatable {
  final List<TodoEntity>? todos;
  final String? message;

  //constructure
  const TodoState({this.message, this.todos});

  @override
  List<Object?> get props => [message, todos];
}

//intial state
class TodoInitialState extends TodoState {
  const TodoInitialState() : super(message: null, todos: null);
}

//loading state
class TodoLoadingState extends TodoState {
  const TodoLoadingState() : super(message: null, todos: null);
}

//success state
class TodoSuccessState extends TodoState {
  const TodoSuccessState(List<TodoEntity> todos)
    : super(message: null, todos: todos);
}

//error state
class TodoErrorState extends TodoState {
  const TodoErrorState(String message) : super(message: message, todos: null);
}
