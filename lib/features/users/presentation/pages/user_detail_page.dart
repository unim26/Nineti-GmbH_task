import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/App_Style/app_text_style.dart';
import 'package:task/features/todos/presentation/pages/todo_detail_section.dart';
import 'package:task/features/users/data/models/user_model.dart';
import 'package:task/features/users/domain/entities/user_entity.dart';
import 'package:task/features/users/presentation/pages/user_detail_section.dart';
import 'package:task/features/users/presentation/widgets/extra_detail_tile.dart';
import 'package:task/features/users/presentation/widgets/user_detail_card.dart';

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
          physics: const BouncingScrollPhysics(),
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
                  :
                  currentIndex == 1 ?
                  TodoDetailSection(userId: user.id!):
                  // if (currentIndex == 0) ...[
                  // ] else if (currentIndex == 1) ...[
                  //   // Show Todos list
                  //   Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           "Todos",
                  //           style: AppTextStyle.labelTextStyle(context),
                  //         ),
                  //         const SizedBox(height: 8),
                  //         // Example: Replace with your actual todos data/fetch logic
                  //         ListView.builder(
                  //           shrinkWrap: true,
                  //           physics: const NeverScrollableScrollPhysics(),
                  //           itemCount: 5, // e.g. user.todos.length
                  //           itemBuilder: (context, index) {
                  //             final isDone = index % 2 == 0; // sample state
                  //             return CheckboxListTile(
                  //               value: isDone,
                  //               onChanged: (v) {
                  //                 /* toggle logic */
                  //               },
                  //               title: Text("Todo item #$index"),
                  //             );
                  //           },
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ] else if (currentIndex == 2) ...[
                  //   // Show Posts list
                  //   Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           "Posts",
                  //           style: AppTextStyle.labelTextStyle(context),
                  //         ),
                  //         const SizedBox(height: 8),
                  //         // Example: Replace with your actual posts data/fetch logic
                  //         ListView.builder(
                  //           shrinkWrap: true,
                  //           physics: const NeverScrollableScrollPhysics(),
                  //           itemCount: 5, // e.g. user.posts.length
                  //           itemBuilder: (context, index) {
                  //             return Card(
                  //               margin: const EdgeInsets.symmetric(vertical: 6),
                  //               child: ListTile(
                  //                 leading: const Icon(Icons.article, size: 28),
                  //                 title: Text("Post Title #$index"),
                  //                 subtitle: Text("Post body preview..."),
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ],
                  const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
