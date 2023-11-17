import 'dart:async';

import 'package:app/user.dart';

class SignInController {
  User? user;
  final formController = SigninFormController();
  final repository = SignInRepository();

  final StreamController<SigninEvent> _controller =
      StreamController.broadcast();
  Stream<SigninEvent> get stream => _controller.stream;

  SignInController() {
    _controller.onListen = () => formController.stream.listen(
          (event) {
            if (event.type == SigninEventType.authorize && event.data != null) {
              login(event.data['username'], event.data['password']);
            }
          },
        );
  }

  login(String username, String password) {
    user = repository.signIn(username, password);
    if (user != null) {
      _controller.sink.add(
        SigninEvent(
          SigninEventType.authorize,
          status: SigninStatus.success,
          data: 'wellcome user: ${user!.username}',
        ),
      );
    }
  }
}
