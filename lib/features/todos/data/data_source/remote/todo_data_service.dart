import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task/features/todos/data/models/todo_model.dart';

part 'todo_data_service.g.dart';

@RestApi(baseUrl: "https://dummyjson.com/")
abstract class TodoDataService {
  factory TodoDataService(Dio dio) = _TodoDataService;

  //api call for getting all todo of user by user id
  @GET('/todos/user/{userId}')
  Future<HttpResponse<List<TodoModel>>> getAllTodoByUserId(
    @Path("userId") int userId,
  );
}
