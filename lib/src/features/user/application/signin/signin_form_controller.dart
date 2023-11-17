import 'dart:async';

import 'package:app/core.dart';
import 'signin_form_event.dart';

class SigninFormController {
  static const VALID_ALL = 0xffff;
  static const VALID_USERNAME = 1;
  static const VALID_PASSWORD = 1 << 1;
  int _isValid = 0;
  String _username = '';
  String _password = '';

  final StreamController<dynamic> _controller = StreamController.broadcast();
  Stream<dynamic> get _stream => _controller.stream;

  SigninFormController() {
    _isValid = VALID_ALL ^ 3;
  }

  Stream<T> on<T>() {
    return _stream.where((event) => event is T).cast();
  }

  onUsernameChanged(value) {
    _username = value;
    // TODO: logic to validate username
    final valid = (_username != '');
    _updateValidate(VALID_USERNAME, valid);
  }

  onPasswordChanged(value) {
    _password = value;
    // TODO: logic to validate password
    final valid = (_password != '');
    _updateValidate(VALID_PASSWORD, valid);
  }

  _updateValidate(int field, bool valid) {
    // if flag turn on: turn off it
    if (_isValid & field == field) {
      _isValid ^= field;
    }
    if (valid) {
      _isValid |= field;
    }

    _controller.sink.add(SigninValidateEvent(
      status: valid ? EventStatus.success : EventStatus.error,
      field: field,
      message: 'missing data',
    ));

    if (_isValid == VALID_ALL) {
      _controller.sink.add(SigninValidateEvent(
        status: EventStatus.success,
        field: VALID_ALL,
      ));
    }
  }

  onSubmit() {
    _controller.sink.add(SigninSubmitEvent(
      username: _username,
      password: _password,
    ));
  }
}
