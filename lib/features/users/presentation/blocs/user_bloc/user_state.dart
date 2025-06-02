import 'package:equatable/equatable.dart';
import 'package:task/features/users/domain/entities/user_entity.dart';

abstract class UserState extends Equatable {
  final List<UserEntity>? users;
  final String? message;

  const UserState({this.message, this.users});

  @override
  List<Object?> get props => [users, message];
}

//initial state
class UserInitialState extends UserState {
  const UserInitialState() : super(message: null, users: null);
}

//loading state
class UserLoadingState extends UserState {
  const UserLoadingState() : super(message: null, users: null);
}

//success state
class UserSuccessState extends UserState {
  const UserSuccessState(List<UserEntity> users)
    : super(message: null, users: users);
}

//failed state
class UserFailedState extends UserState {
  const UserFailedState(String message) : super(message: message);
}
