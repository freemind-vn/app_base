import 'dart:async';

import 'signin_event.dart';

class SigninFormController {
  static const VALID_ALL = 0xffff;
  static const VALID_USERNAME = 1;
  static const VALID_PASSWORD = 1 << 1;
  int _isValid = 0;
  String _username = '';
  String _password = '';

  final StreamController<SigninEvent> _controller =
      StreamController.broadcast();
  Stream<SigninEvent> get stream => _controller.stream;

  SigninFormController() {
    _isValid = VALID_ALL ^ 3;
  }

  onUsernameChanged(value) {
    _username = value;
    // TODO: logic to validate Username
    _validateInput(VALID_USERNAME);
  }

  onPasswordChanged(value) {
    _password = value;
    // TODO: logic to validate Username
    _validateInput(VALID_PASSWORD);
  }

  _validateInput(int input) {
    // if flag turn on: turn off it
    if (_isValid & input == input) {
      _isValid ^= input;
    }

    switch (input) {
      case VALID_USERNAME:
        _isValid |= (_username != '' ? VALID_USERNAME : 0);
        break;
      case VALID_PASSWORD:
        _isValid |= (_password != '' ? VALID_PASSWORD : 0);
        break;
    }

    if (_isValid == VALID_ALL) {
      _controller.sink.add(SigninEvent(
        SigninEventType.validate,
        status: SigninStatus.success,
      ));
    } else {
      _controller.sink.addError(SigninEvent(
        SigninEventType.validate,
        status: SigninStatus.error,
        data: 'missing data',
      ));
    }
  }

  onSubmit() {
    _controller.sink.add(SigninEvent(
      SigninEventType.authorize,
      status: SigninStatus.success,
      data: {
        'username': _username,
        'password': _password,
      },
    ));
  }
}
