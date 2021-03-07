import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int userId;
  String name;
  String photoUrl;
  String userName;
}
