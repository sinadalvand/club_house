/// define all route here

enum Director {
  WELCOME,
  SIGN_IN,
  VERIFY_PHONE,
  WAIT_LIST,
  MAIN_PAGE,
  REGISTER_NAME,
}

extension DirectorExtension on Director {
  String get route {
    switch (this) {
      case Director.SIGN_IN:
        return '/signin';
        case Director.VERIFY_PHONE:
        return '/verify';
      default:
        return '/';
    }
  }
}
