/// define all route here

enum Director {
  WELCOME,
  SIGN_IN,
}

extension DirectorExtension on Director {
  String get route {
    switch (this) {
      case Director.SIGN_IN:
        return '/signin';
      default:
        return '/';
    }
  }
}
