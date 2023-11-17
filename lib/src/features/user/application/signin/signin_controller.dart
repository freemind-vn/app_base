import 'dart:async';

import 'package:app/core.dart';
import 'package:app/user.dart';

class SignInController {
  User? user;
  final formController = SigninFormController();
  final repository = SignInRepository();

  final StreamController<AuthorizeEvent> _controller =
      StreamController.broadcast();
  Stream<AuthorizeEvent> get stream => _controller.stream;

  SignInController() {
    formController.on<SigninSubmitEvent>().listen((event) {
      login(event.username, event.password);
    });
  }

  login(String username, String password) {
    user = repository.signIn(username, password);
    if (user != null) {
      _controller.sink.add(
        AuthorizeEvent(
          status: EventStatus.success,
          message: 'wellcome ${user!.username}',
        ),
      );
    }
  }
}
