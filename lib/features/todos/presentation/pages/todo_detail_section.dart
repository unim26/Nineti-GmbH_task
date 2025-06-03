import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/App_Style/app_text_style.dart';
import 'package:task/core/utils/widgets/app_loading_indicator.dart';
import 'package:task/core/utils/widgets/app_snacbar.dart';
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
            } else if (state is TodoErrorState) {
              return Center(
                child: Text(
                  state.message!,
                  style: AppTextStyle.infoTextStyle(context),
                ),
              );
            } else {
              return Column(
                children: [
                  state.todos!.isEmpty
                      ? Center(
                        child: Text(
                          "No todo created yet.....!",
                          style: AppTextStyle.infoTextStyle(context),
                        ),
                      )
                      : SizedBox(),

                  //list all todos
                  ...state.todos!.map(
                    (todo) => Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ).copyWith(bottom: 15),
                      padding: EdgeInsets.all(15).copyWith(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.secondary,

                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 3,
                            spreadRadius: 2,
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
                          isCompleted
                              ? IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.delete, color: Colors.red),
                              )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
