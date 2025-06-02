import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/App_Style/app_text_style.dart';
import 'package:task/core/utils/widgets/app_loading_indicator.dart';
import 'package:task/core/utils/widgets/app_snacbar.dart';
import 'package:task/features/users/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:task/features/users/presentation/blocs/user_bloc/user_event.dart';
import 'package:task/features/users/presentation/blocs/user_bloc/user_state.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    //call get all user method
    context.read<UserBloc>().add(GetAllUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "All Users",
            style: AppTextStyle.appBarTextStyle(context),
          ),
          centerTitle: true,
        ),

        //body
        body: BlocConsumer<UserBloc, UserState>(
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
              return ListView.builder(
                itemCount: state.users!.length,
                itemBuilder: (context, index) {
                  final user = state.users![index];

                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ).copyWith(bottom: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                      ).copyWith(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 3,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          //image
                          CircleAvatar(
                            foregroundImage: NetworkImage(user.image!),
                            maxRadius: screenSize.width * .085,
                          ),

                          //space
                          SizedBox(width: 10),

                          //name and email
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //name
                              Text(
                                "${user.firstName} ${user.lastName}",
                                style: AppTextStyle.titleTextStyle(context),
                              ),

                              //email
                              Text(
                                user.email!,
                                softWrap: true,
                                style: AppTextStyle.subTitleTextStyle(context),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
