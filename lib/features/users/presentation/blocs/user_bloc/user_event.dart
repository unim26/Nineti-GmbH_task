abstract class UserEvent {
  const UserEvent();
}

//get all user event
class GetAllUserEvent extends UserEvent {
  const GetAllUserEvent();
}

//search user event
class SearchUserEvent extends UserEvent {
  final String query;

  const SearchUserEvent({required this.query});
}
