import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/features/posts/data/models/local_post_model.dart';
import 'package:uuid/v4.dart';

class PostLocalDataService {
  static final PostLocalDataService _instance =
      PostLocalDataService._internal();

  factory PostLocalDataService() => _instance;

  PostLocalDataService._internal();

  //post box
  late Box postBox;

  //init method
  Future<void> init() async {
    await Hive.initFlutter();

    postBox = await Hive.openBox('postBox');
  }

  //method to create local post
  Future<void> createLocalPost({String? title,String? body,int? userId}) async {
    final jsonData = {'title' : title,'body' : body,'userId':userId};
    final String uniqueKey = const UuidV4().generate();
    await postBox.put(uniqueKey, jsonData);
  }

  //metho to get all local posts
  List<LocalPostModel> getUserLocalPost(int userId) {
    final allPosts =
        postBox.values
            .map(
              (post) =>
                  LocalPostModel.fromJson(Map<String, dynamic>.from(post)),
            )
            .toList();

    return allPosts.where((post) => post.userId == userId).toList();
  }
}
