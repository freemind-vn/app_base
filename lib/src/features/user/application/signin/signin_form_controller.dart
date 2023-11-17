import 'dart:async';

import 'package:app/core.dart';
import 'signin_form_event.dart';

extension FilterExtension on Stream<SigninValidateEvent> {
  Stream<SigninValidateEvent> byField(int field) {
    return where((event) => event.field == field);
  }
}

class SigninFormController {
  static const validAll = 0xffff;
  static const validUsername = 1;
  static const validPassword = 1 << 1;

  SigninFormController() {
    _isValid = validAll ^ 3;
  }

  int _isValid = 0;
  String _username = '';
  String _password = '';

  final StreamController<dynamic> _controller = StreamController.broadcast();

  Stream<dynamic> get _stream => _controller.stream;

  Stream<T> on<T>() {
    return _stream.where((event) => event is T).cast();
  }

  onUsernameChanged(value) {
    _username = value;
    // TODO: logic to validate username
    final valid = (_username != '');
    _updateValidate(validUsername, valid);
  }

  onPasswordChanged(value) {
    _password = value;
    // TODO: logic to validate password
    final valid = (_password != '');
    _updateValidate(validPassword, valid);
  }

  _updateValidate(int field, bool valid) {
    final currentState = (_isValid & field == field);
    // check state and update if needed
    if (valid != currentState) {
      if (!valid) {
        _isValid ^= field;
      } else {
        _isValid |= field;
      }
      _controller.sink.add(SigninValidateEvent(
        status: valid ? EventStatus.success : EventStatus.error,
        field: field,
        message: 'missing data',
      ));

      if (_isValid == validAll) {
        _controller.sink.add(SigninValidateEvent(
          status: EventStatus.success,
          field: validAll,
        ));
      }
    }
  }

  onSubmit() {
    _controller.sink.add(SigninSubmitEvent(
      username: _username,
      password: _password,
    ));
  }
}
