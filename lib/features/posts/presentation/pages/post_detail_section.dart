import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/App_Style/app_text_style.dart';
import 'package:task/core/utils/widgets/app_loading_indicator.dart';
import 'package:task/core/utils/widgets/app_snacbar.dart';
import 'package:task/features/posts/domain/entities/local_post_entity.dart';
import 'package:task/features/posts/presentation/bloc/post_bloc/post_bloc.dart';
import 'package:task/features/posts/presentation/bloc/post_bloc/post_event.dart';
import 'package:task/features/posts/presentation/bloc/post_bloc/post_state.dart';
import 'package:task/features/posts/presentation/widgets/post_action_widget.dart';

class PostDetailSection extends StatefulWidget {
  final int userId;
  const PostDetailSection({super.key, required this.userId});

  @override
  State<PostDetailSection> createState() => _PostDetailSectionState();
}

class _PostDetailSectionState extends State<PostDetailSection> {
  @override
  void initState() {
    context.read<PostBloc>().add(
      GetAllPostByUserIdEvent(userId: widget.userId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {
        //if state is error state
        if (state is PostErrorState) {
          appSnacBar(context, message: state.message, type: 'error');
        }
      },
      builder: (context, state) {
        if (state is PostInitialState || state is PostLoadingState) {
          return appLoadingIndicator();
        } else if (state is PostErrorState) {
          return Center(
            child: Text(
              state.message!,
              style: AppTextStyle.infoTextStyle(context),
            ),
          );
        } else {
          final List postData = [
            ...state.localPosts ?? [],
            ...state.posts ?? [],
          ];
          return Column(
            children: [
              postData.isEmpty
                  ? Center(
                    child: Text(
                      "NO post created yet....!",
                      style: AppTextStyle.infoTextStyle(context),
                    ),
                  )
                  : SizedBox(),

              //show all post
              ...postData.map(
                (post) => Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ).copyWith(bottom: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.secondary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 2,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        post.title ?? '',
                        style: AppTextStyle.titleTextStyle(context),
                      ),

                      // Tags
                      if (post is! LocalPostEntity && post.tags != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children:
                                (post.tags ?? [])
                                    .map<Widget>(
                                      (tag) => Text(
                                        "#$tag",
                                        style: AppTextStyle.infoTextStyle(
                                          context,
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        ),

                      // Body
                      Text(
                        post.body ?? '',
                        style: AppTextStyle.subTitleTextStyle(context),
                      ),

                      // Actions
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PostActionWidget(
                            icon: Icons.remove_red_eye_outlined,
                            value:
                                post is LocalPostEntity ? 0 : post.views ?? 0,
                          ),
                          PostActionWidget(
                            icon: Icons.thumb_up_alt_outlined,
                            value:
                                post is LocalPostEntity
                                    ? 0
                                    : post.reactions?.likes ?? 0,
                          ),
                          PostActionWidget(
                            icon: Icons.thumb_down_alt_outlined,
                            value:
                                post is LocalPostEntity
                                    ? 0
                                    : post.reactions?.dislikes ?? 0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
