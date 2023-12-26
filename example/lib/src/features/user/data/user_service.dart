import 'user.dart';

class UserService {
  User signIn(String username, String password) {
    // Call fetch or sdk then return the user
    return User(username: username);
  }

  signOut() {
    throw UnimplementedError();
  }
}
