import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:task/core/App_Style/app_text_style.dart';
import 'package:task/core/utils/controllers/theme_controller.dart';
import 'package:task/core/utils/widgets/app_loading_indicator.dart';
import 'package:task/core/utils/widgets/app_snacbar.dart';
import 'package:task/core/utils/widgets/app_text_field.dart';
import 'package:task/features/users/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:task/features/users/presentation/blocs/user_bloc/user_event.dart';
import 'package:task/features/users/presentation/blocs/user_bloc/user_state.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  //controller
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    //call get all user method
    context.read<UserBloc>().add(GetAllUserEvent());
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(

        //app bar
        appBar: AppBar(
          title: Text(
            "All Users",
            style: AppTextStyle.appBarTextStyle(context),
          ),
          centerTitle: true,
          actions: [
            //theme toggle button
            IconButton(
              onPressed:
                  () => context.read<ThemeController>().toggleThemeMode(),
              icon:
                  context.watch<ThemeController>().isdarkMode
                      ? Icon(Icons.light_mode_outlined)
                      : Icon(Icons.dark_mode_outlined),
            ),
          ],
        ),

        //body
        body: Column(
          children: [
            //search bar
            Padding(
              padding: const EdgeInsets.all(20).copyWith(top: 10),
              child: AppTextField(
                minLines: 1,
                maxLines: 1,
                onChanged: (value) {
                  if (value.isEmpty) {
                    if (value.trim().isEmpty) {
                      context.read<UserBloc>().add(GetAllUserEvent());
                    } else {
                      context.read<UserBloc>().add(
                        SearchUserEvent(query: value),
                      );
                    }
                  }
                },
                onFieldSubmitted: (value) {
                  context.read<UserBloc>().add(SearchUserEvent(query: value));
                },
                prefixIcon: Icons.search,
                labelText: "Search user by name",
                hintText: 'John',
              ),
            ),

            //page data
            BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                //error state
                if (state is UserErrorState) {
                  appSnacBar(context, message: state.message, type: 'error');
                }
              },
              builder: (context, state) {
                if (state is UserLoadingState || state is UserInitialState) {
                  return appLoadingIndicator();
                } else if (state is UserErrorState) {
                  return Center(
                    child: Text(
                      state.message!,
                      style: AppTextStyle.infoTextStyle(context),
                    ),
                  );
                } else {
                  return state is UserSearchingState &&
                          state.searchedUser!.isEmpty
                      ? Center(
                        child: Text(
                          "No user found....!",
                          style: AppTextStyle.infoTextStyle(context),
                        ),
                      )
                      : Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            context.read<UserBloc>().add(GetAllUserEvent());
                          },
                          child: ListView.builder(
                            itemCount:
                                state is UserSearchingState &&
                                        state.searchedUser!.isNotEmpty
                                    ? state.searchedUser!.length
                                    : state.users!.length,
                            itemBuilder: (context, index) {
                              final user =
                                  state is UserSearchingState
                                      ? state.searchedUser![index]
                                      : state.users![index];

                              return GestureDetector(
                                onTap:
                                    () => Get.toNamed(
                                      '/user-detail-page',
                                      arguments: {'user': user},
                                    ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 15,
                                  ).copyWith(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        Theme.of(context).colorScheme.secondary,

                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        spreadRadius: 2,
                                        color: Colors.grey.shade300,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      //image
                                      CircleAvatar(
                                        foregroundImage: NetworkImage(
                                          user.image!,
                                        ),
                                        maxRadius: screenSize.width * .085,
                                      ),

                                      //space
                                      SizedBox(width: 10),

                                      //name and email
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //name
                                          Text(
                                            "${user.firstName} ${user.lastName}",
                                            style: AppTextStyle.titleTextStyle(
                                              context,
                                            ),
                                          ),

                                          //email
                                          Text(
                                            user.email!,
                                            softWrap: true,
                                            style:
                                                AppTextStyle.subTitleTextStyle(
                                                  context,
                                                ),
                                          ),
                                        ],
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
