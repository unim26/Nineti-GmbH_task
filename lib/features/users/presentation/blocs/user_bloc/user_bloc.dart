import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/resources/data_state.dart';
import 'package:task/features/users/domain/usecases/get_all_user_usecase.dart';
import 'package:task/features/users/presentation/blocs/user_bloc/user_event.dart';
import 'package:task/features/users/presentation/blocs/user_bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  //instance of getalluse usecase
  final GetAllUserUsecase _getAllUserUsecase;

  //constructure

  UserBloc(this._getAllUserUsecase) : super(UserInitialState()) {
    //on get all event
    on<GetAllUserEvent>(onGetAllUserEvent);
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
