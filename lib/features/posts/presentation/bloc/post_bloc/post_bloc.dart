import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/resources/data_state.dart';
import 'package:task/features/posts/domain/usecases/create_local_post_usecase.dart';
import 'package:task/features/posts/domain/usecases/get_all_post_by_userid_usecase.dart';
import 'package:task/features/posts/domain/usecases/get_local_post_by_userid_usecase.dart';
import 'package:task/features/posts/presentation/bloc/post_bloc/post_event.dart';
import 'package:task/features/posts/presentation/bloc/post_bloc/post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  //instance of get all post by userid usecase
  final GetAllPostByUseridUsecase _getAllPostByUseridUsecase;
  //instance of get local post b userid usecase
  final GetLocalPostByUseridUsecase _getLocalPostByUseridUsecase;
  //instance of create local post usecase
  final CreateLocalPostUsecase _createLocalPostUsecase;

  //constructure
  PostBloc(
    this._getAllPostByUseridUsecase,
    this._getLocalPostByUseridUsecase,
    this._createLocalPostUsecase,
  ) : super(PostInitialState()) {
    //on get all post by userid event call
    on<GetAllPostByUserIdEvent>(onGetAllPostByUserIDEvent);
    //on create post event call
    on<CreateLocalPostEvent>(onCreateLocalPostByUserId);
  }

  //on get local post by user id call
  void onCreateLocalPostByUserId(
    CreateLocalPostEvent event,
    Emitter<PostState> emit,
  ) async {
    emit(PostLoadingState());

    //call usecase
    final datastate = await _createLocalPostUsecase.call({'body': event.body,'title':event.title,'userId':event.userId});

    //check data
    if (datastate.data!) {
      emit(PostCreatedState("Post created.....!"));
    }

    if (!datastate.data!) {
      emit(PostErrorState("Something went wrong while creating post"));
    }
  }

  //on get all post by userid event call
  void onGetAllPostByUserIDEvent(
    GetAllPostByUserIdEvent event,
    Emitter<PostState> emit,
  ) async {
    //emit loading
    emit(PostLoadingState());

    //call usecase
    final datastate = await _getAllPostByUseridUsecase.call(event.userId);

    //local post
    final localdata = _getLocalPostByUseridUsecase.call(event.userId);

    //check data
    if (datastate is DataSuccess) {
      emit(PostSuccessState(datastate.data!, localdata.data));
    }

    if (datastate is DataFailed) {
      emit(PostErrorState(datastate.message!));
    }
  }
}
