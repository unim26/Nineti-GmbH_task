
abstract class PostEvent {
  const PostEvent();
}

//get all post bu user id event
class GetAllPostByUserIdEvent extends PostEvent {
  final int userId;

  const GetAllPostByUserIdEvent({required this.userId});
}


//create local post event
class CreateLocalPostEvent extends PostEvent {
  final String body;
  final String title;
  final int userId;

  const CreateLocalPostEvent({required this.title,required this.userId, required this.body,});
}
