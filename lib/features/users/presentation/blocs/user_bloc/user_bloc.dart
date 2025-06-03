import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/resources/data_state.dart';
import 'package:task/features/users/domain/usecases/get_all_user_usecase.dart';
import 'package:task/features/users/domain/usecases/search_user_usecase.dart';
import 'package:task/features/users/presentation/blocs/user_bloc/user_event.dart';
import 'package:task/features/users/presentation/blocs/user_bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  //instance of getalluse usecase
  final GetAllUserUsecase _getAllUserUsecase;
  //instance of search user usecase
  final SearchUserUsecase _searchUserUsecase;

  //constructure

  UserBloc(this._getAllUserUsecase, this._searchUserUsecase)
    : super(UserInitialState()) {
    //on get all event
    on<GetAllUserEvent>(onGetAllUserEvent);
    //on search user event call
    on<SearchUserEvent>(onSearchUserEvent);
  }

  //on searchUserEvent call
  void onSearchUserEvent(SearchUserEvent event, Emitter<UserState> emit) async {
    //emit loading
    emit(UserLoadingState());

    //  call search user use case
    final datastate = await _searchUserUsecase.call(event.query);

    //check data
    if (datastate is DataSuccess) {
      emit(UserSearchingState(datastate.data!));
    }

    if (datastate is DataFailed) {
      emit(UserErrorState(datastate.message!));
    }
  }

  //on getAllEvent call
  void onGetAllUserEvent(GetAllUserEvent event, Emitter<UserState> emit) async {
    //emit loading state
    emit(UserLoadingState());

    //call get al user use case
    final datastate = await _getAllUserUsecase.call(null);

    //check data
    if (datastate is DataSuccess) {
      emit(UserSuccessState(datastate.data!));
    }

    if (datastate is DataFailed) {
      emit(UserErrorState(datastate.message!));
    }
  }
}
