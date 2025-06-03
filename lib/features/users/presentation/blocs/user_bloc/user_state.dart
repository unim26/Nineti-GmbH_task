import 'package:equatable/equatable.dart';
import 'package:task/features/users/domain/entities/user_entity.dart';

abstract class UserState extends Equatable {
  final List<UserEntity>? users;
  final List<UserEntity>? searchedUser;
  final String? message;

  const UserState({this.message, this.users, this.searchedUser});

  @override
  List<Object?> get props => [users, message, searchedUser];
}

//initial state
class UserInitialState extends UserState {
  const UserInitialState();
}

//loading state
class UserLoadingState extends UserState {
  const UserLoadingState() : super();
}

//success state
class UserSuccessState extends UserState {
  const UserSuccessState(List<UserEntity> users) : super(users: users);
}

//seraching state
class UserSearchingState extends UserState {
  const UserSearchingState(List<UserEntity> searchedUser)
    : super(searchedUser: searchedUser);
}

//failed state
class UserErrorState extends UserState {
  const UserErrorState(String message) : super(message: message);
}
