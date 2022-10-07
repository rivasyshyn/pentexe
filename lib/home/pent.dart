import 'package:pentexe/user/user.dart';
import 'package:uuid/uuid.dart';

class Pent {
  final String id;
  User user;
  String body;
  List<int> likes;
  List<int> dislikes;

  int created;

  Pent(this.id, this.body, this.user, this.created,
      {this.likes = const [], this.dislikes = const []});

  factory Pent.create(String body, User user) => Pent(
      const Uuid().v4(), body, user, DateTime.now().microsecondsSinceEpoch);

  like() {
    likes.add(DateTime.now().microsecondsSinceEpoch);
  }

  dislike() {
    dislikes.add(DateTime.now().microsecondsSinceEpoch);
  }
}
