class User {
  final String username;
  String? firstname;
  String? lastname;

  User({required this.username, this.firstname, this.lastname});
}

class SignInRepository {
  User signIn(String username, String password) {
    // Call fetch or sdk then return the user
    return User(username: username);
  }

  signOut() {
    throw UnimplementedError();
  }
}
