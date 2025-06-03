import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/App_Style/app_text_style.dart';
import 'package:task/features/posts/presentation/pages/post_detail_section.dart';
import 'package:task/features/todos/presentation/pages/todo_detail_section.dart';
import 'package:task/features/users/data/models/user_model.dart';
import 'package:task/features/users/domain/entities/user_entity.dart';
import 'package:task/features/users/presentation/pages/user_detail_section.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({super.key});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  final userOptions = ["User Detail", "Todos", "Posts"];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    // We expect a UserModel passed via Get.arguments:
    final Map<String, dynamic> args = Get.arguments as Map<String, dynamic>;
    final UserEntity user = args['user'] as UserModel;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "User details",
            style: AppTextStyle.appBarTextStyle(context),
          ),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              // ─────────── User Avatar ───────────
              const SizedBox(height: 16),
              Center(
                child: CircleAvatar(
                  foregroundImage: NetworkImage(user.image!),
                  maxRadius: size.width * .25,
                ),
              ),
              const SizedBox(height: 16),

              // ─────────── User Name & Email ───────────
              Text(
                "${user.firstName} ${user.lastName}",
                style: AppTextStyle.titleTextStyle(context),
              ),
              const SizedBox(height: 4),
              Text(user.email!, style: AppTextStyle.subTitleTextStyle(context)),
              const SizedBox(height: 24),

              // ─────────── Options Row ───────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(userOptions.length, (index) {
                    final isSelected = index == currentIndex;
                    return GestureDetector(
                      onTap: () => setState(() => currentIndex = index),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Option Label
                          Text(
                            userOptions[index],
                            style:
                                isSelected
                                    ? AppTextStyle.labelTextStyle(
                                      context,
                                    ).copyWith(color: Colors.blue)
                                    : AppTextStyle.labelTextStyle(context),
                          ),

                          const SizedBox(height: 4),

                          // Underline appears only if this index is selected
                          if (isSelected)
                            Container(
                              width: size.width * .2,
                              height: 2,
                              color: Colors.blue,
                            )
                          else
                            const SizedBox(height: 2),
                        ],
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 16),

              // ─────────── Conditional Content ───────────
              currentIndex == 0
                  ? UserDetailSection(user: user)
                  : currentIndex == 1
                  ? TodoDetailSection(userId: user.id!)
                  : PostDetailSection(userId: user.id!),
            ],
          ),
        ),

        //floating action button
        floatingActionButton:
            currentIndex == 2
                ? FloatingActionButton.extended(
                  onPressed:
                      () => Get.toNamed(
                        '/create-post-page',
                        arguments: {'userId': user.id},
                      ),
                  label: Row(
                    children: [
                      //text
                      Text(
                        'Create Post',
                        style: AppTextStyle.subTitleTextStyle(
                          context,
                        ).copyWith(color: Colors.black),
                      ),

                      //icon
                      Icon(Icons.add, color: Colors.black),
                    ],
                  ),
                )
                : null,
      ),
    );
  }
}
