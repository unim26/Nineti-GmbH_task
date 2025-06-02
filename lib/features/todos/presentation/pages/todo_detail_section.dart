import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/App_Style/app_text_style.dart';
import 'package:task/core/utils/widgets/app_loading_indicator.dart';
import 'package:task/core/utils/widgets/app_snacbar.dart';
import 'package:task/features/todos/domain/entities/todo_entity.dart';
import 'package:task/features/todos/domain/usecases/get_all_todo_by_userid_usecase.dart';
import 'package:task/features/todos/presentation/blocs/todo_bloc/todo_bloc.dart';
import 'package:task/features/todos/presentation/blocs/todo_bloc/todo_event.dart';
import 'package:task/features/todos/presentation/blocs/todo_bloc/todo_state.dart';

class TodoDetailSection extends StatefulWidget {
  final int userId;
  const TodoDetailSection({super.key, required this.userId});

  @override
  State<TodoDetailSection> createState() => _TodoDetailSectionState();
}

class _TodoDetailSectionState extends State<TodoDetailSection> {
  bool isCompleted = false;

  @override
  void initState() {
    context.read<TodoBloc>().add(
      GetAllTodoByUserIdEvent(userId: widget.userId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) {
            //if state is error state
            if (state is TodoErrorState) {
              appSnacBar(context, message: state.message, type: 'error');
            }
          },
          builder: (context, state) {
            if (state is TodoInitialState || state is TodoLoadingState) {
              return appLoadingIndicator();
            } else if (state is TodoErrorState || state.todos!.isEmpty) {
              return Center(child: Text('NO todo created yet......!'));
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.todos!.length,
                itemBuilder: (context, index) {
                  final TodoEntity todo = state.todos![index];
                  isCompleted = todo.isCompleted!;
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ).copyWith(bottom: 10),
                    padding: EdgeInsets.all(15).copyWith(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        //check box
                        Checkbox(
                          value: isCompleted,
                          onChanged: (value) {
                            setState(() {
                              isCompleted = value!;
                            });
                          },
                        ),

                        //todo
                        Expanded(
                          child: Text(
                            todo.todo!,
                            style: AppTextStyle.subTitleTextStyle(context),
                          ),
                        ),

                        //delete button
                        todo.isCompleted!
                            ? IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete, color: Colors.red),
                            )
                            : SizedBox(),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
