/// define all route here

enum Director {
  WELCOME,
  SIGN_IN,
  VERIFY_PHONE,
  WAIT_LIST,
  MAIN_PAGE,
  REGISTER_NAME,
  REGISTER_USERNAME,
  REGISTER_PROPIC,
  PROFILE,
  SEARCH,
}

extension DirectorExtension on Director {
  String get route {
    switch (this) {
      case Director.SIGN_IN:
        return '/signin';
      case Director.VERIFY_PHONE:
        return '/verify';
      case Director.MAIN_PAGE:
        return '/main';
      case Director.WAIT_LIST:
        return '/waitlist';
      case Director.REGISTER_NAME:
        return '/register_name';
        case Director.REGISTER_USERNAME:
        return '/register_username';
        case Director.REGISTER_PROPIC:
        return '/register_propic';
        case Director.PROFILE:
        return '/profile';
        case Director.SEARCH:
        return '/search';
      default:
        return '/';
    }
  }
}
