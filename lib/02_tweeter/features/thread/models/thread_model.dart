// thread_model.dart
class ThreadModel {
  String title;
  String userName;
  String postText;
  String postTime;
  List<String> postImages;
  int repNum;
  int likeNum;
  String userIcon;
  String avator1;
  String avator2;
  String avator3;

  ThreadModel({
    required this.title,
    required this.userName,
    required this.postText,
    required this.postTime,
    required this.postImages,
    required this.repNum,
    required this.likeNum,
    required this.userIcon,
    required this.avator1,
    required this.avator2,
    required this.avator3,
  });
}
