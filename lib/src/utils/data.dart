import 'dart:math';

Random random = Random();

String dummyText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit? ❤🏠🏠';

// User
List names = [
  'American Bobtail',
  'British Shorthair',
  'Cornish Rex',
  'Egyptian Mau',
  'Devon Rex',
  'Exotic Shorthair',
  'Japanese Bobtail',
  'Maine Coon',
  'Scottish Fold',
  'Selkirk Rex',
  'American Bobtail2',
  'British Shorthair2',
  'Cornish Rex2',
  'Egyptian Mau2',
  'Devon Rex2',
  'Exotic Shorthair2',
  'Japanese Bobtail2',
  'Maine Coon2',
  'Scottish Fold2',
  'Selkirk Rex2',
];

List userData = List.generate(
  20,
  (index) => {
    'name': names[index],
    'username': '@${names[index].toString().split(' ')[0].toLowerCase()}',
    'profileImage': 'assets/images/propic.jpg',
    'followers': '1k',
    'following': '1',
    'lastAccessTime': '${index + 10}m',
    'isNewUser': random.nextBool(),
  },
);

// MyProfile
dynamic profileData = {
  'name': 'Golden Retriever',
  'username': '@dog',
  'profileImage': 'assets/images/propic.jpg',
  'followers': '1k',
  'following': '1',
  'lastAccessTime': '0m',
  'isNewUser': random.nextBool(),
};

// Room
List roomData = List.generate(
  10,
  (index) => {
    'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit? ❤🏠🏠',
    "users": List.generate(20, (index) => User.fromJson(userData[index]))
      ..shuffle(),
    'speakerCount': 4,
  },
);

List<Room> rooms = List.generate(
  10,
  (index) => Room.fromJson(roomData[index]),
);



List<User> users = List.generate(20, (index) => User.fromJson(userData[index]));
User myProfile = User.fromJson(profileData);

class User {
  final String name;
  final String username;
  final String profileImage;
  final String lastAccessTime;
  final String followers;
  final String following;
  final bool isNewUser;

  User({
    this.name,
    this.username,
    this.profileImage,
    this.followers,
    this.following,
    this.lastAccessTime,
    this.isNewUser,
  });

  factory User.fromJson(json) {
    return User(
      name: json['name'],
      username: json['username'],
      profileImage: json['profileImage'],
      lastAccessTime: json['lastAccessTime'],
      followers: json['followers'],
      following: json['following'],
      isNewUser: json['isNewUser'],
    );
  }
}

class Room {
  final String title;
  final List<User> users;
  final int speakerCount;

  Room({
    this.title,
    this.speakerCount,
    this.users,
  });

  factory Room.fromJson(json) {
    return Room(
      title: json['title'],
      users: json['users'],
      speakerCount: json['speakerCount'],
    );
  }
}