import 'package:app/user.dart';

class SignInRepository {
  final service = UserService();

  User signIn(String username, String password) {
    return service.signIn(username, password);
  }

  signOut() {
    throw UnimplementedError();
  }
}
