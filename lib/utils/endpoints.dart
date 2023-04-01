class APIEndPoints {
  static const String baseURL = 'http://192.168.43.250:8000/';
  static final AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints {
  final String signIn = 'auth/login/';
  final String signOut = 'auth/logout/';
  final String signUp = 'auth/register/';
  final String profile = 'auth/user/';

}