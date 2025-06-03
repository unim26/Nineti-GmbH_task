import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:task/core/App_Style/app_text_style.dart';
import 'package:task/core/utils/widgets/app_snacbar.dart';
import 'package:task/core/utils/widgets/app_text_field.dart';
import 'package:task/features/posts/presentation/bloc/post_bloc/post_bloc.dart';
import 'package:task/features/posts/presentation/bloc/post_bloc/post_event.dart';
import 'package:task/features/posts/presentation/bloc/post_bloc/post_state.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments as Map<String, dynamic>;
    final int userId = args['userId'] as int;

    //controller
    final TextEditingController titleController = TextEditingController();
    final TextEditingController bodyController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Create post",
            style: AppTextStyle.appBarTextStyle(context),
          ),
          centerTitle: true,
        ),

        //body
        body: BlocConsumer<PostBloc, PostState>(
          listener: (context, state) {
            // state is error state
            if (state is PostErrorState) {
              appSnacBar(context, message: state.message, type: 'error');
            }

            //state is success
            if (state is PostCreatedState) {
              appSnacBar(context, message: state.message, type: 'success');

              //naviagte to back
              Get.offAllNamed('/user-page');
              // Get.back();
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    //space
                    SizedBox(height: 20),

                    //text
                    Text(
                      "Post Title",
                      style: AppTextStyle.infoTextStyle(context),
                    ),
                    //title textfield
                    AppTextField(
                      controller: titleController,
                      labelText: "Post title",
                      hintText: "As you Wish",
                      prefixIcon: Icons.post_add,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'post title field is required';
                        }
                        return null;
                      },
                    ),

                    //space
                    SizedBox(height: 20),

                    //text
                    Text(
                      "Post Body",
                      style: AppTextStyle.infoTextStyle(context),
                    ),
                    //body text field
                    AppTextField(
                      controller: bodyController,
                      labelText: "Post Body",
                      hintText: "your post description",
                      prefixIcon: Icons.description,
                      minLines: 5,
                      maxLines: 10,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'post body field is required';
                        }
                        return null;
                      },
                    ),

                    //space
                    SizedBox(height: 20),

                    //save button
                    Center(
                      child: OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<PostBloc>().add(
                              CreateLocalPostEvent(
                                body: bodyController.text,
                                title: titleController.text,
                                userId: userId,
                              ),
                            );
                          } else {
                            appSnacBar(
                              context,
                              message: "All fields are required",
                              type: 'Alert',
                            );
                          }
                        },
                        child: Text(
                          "Create Post",
                          style: AppTextStyle.labelTextStyle(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
