import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/resources/data_state.dart';
import 'package:task/features/todos/domain/usecases/get_all_todo_by_userid_usecase.dart';
import 'package:task/features/todos/presentation/blocs/todo_bloc/todo_event.dart';
import 'package:task/features/todos/presentation/blocs/todo_bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  //instance of get all todo by user id usecase
  final GetAllTodoByUseridUsecase _getAllTodoByUseridUsecase;

  TodoBloc(this._getAllTodoByUseridUsecase) : super(TodoInitialState()) {
    //on get all todo by userid event
    on<GetAllTodoByUserIdEvent>(onGetAllTodoByUserId);
  }

  //on get all todo by user id event
  void onGetAllTodoByUserId(
    GetAllTodoByUserIdEvent event,
    Emitter<TodoState> emit,
  ) async {
    //emit loading state
    emit(TodoLoadingState());

    //cal usecase
    final datastate = await _getAllTodoByUseridUsecase.call(event.userId);

    //check data
    if (datastate is DataSuccess) {
      emit(TodoSuccessState(datastate.data!));
    }

    if (datastate is DataFailed) {
      emit(TodoErrorState(datastate.message!));
    }
  }
}
