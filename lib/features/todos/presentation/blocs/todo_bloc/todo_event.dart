abstract class TodoEvent {
  const TodoEvent();
}

//event for getting all todos by user id
class GetAllTodoByUserIdEvent extends TodoEvent {
  final int userId;

  GetAllTodoByUserIdEvent({required this.userId});
}
