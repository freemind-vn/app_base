import 'package:app_base/app_base.dart';

import 'package:app/user.dart';

class SignInController extends Controller<AuthorizeEvent> {
  final repository = SignInRepository();

  login(String username, String password) {
    final user = repository.signIn(username, password);
    send(
      AuthorizeEvent(
        status: EventStatus.success,
        message: 'wellcome ${user.username}',
        user: user,
      ),
    );
  }
}
