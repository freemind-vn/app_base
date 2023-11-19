import 'dart:async';

import 'package:app/core.dart';
import 'signin_form_event.dart';

extension StreamSigninValidateEventExtension on Stream<SigninValidateEvent> {
  Stream<SigninValidateEvent> byField(SigninFormField field) {
    return where((event) => event.field == field);
  }
}

class SigninFormController extends Controller {
  static const _validAll = 0xffff;

  SigninFormController() {
    _isValid = _validAll & 0xffff << SigninFormField.all.index;
  }

  int _isValid = 0;
  String _username = '';
  String _password = '';

  onUsernameChanged(value) {
    _username = value;
    // TODO: logic to validate username
    final valid = (_username != '');
    _updateValidate(SigninFormField.username, valid);
  }

  onPasswordChanged(value) {
    _password = value;
    // TODO: logic to validate password
    final valid = (_password != '');
    _updateValidate(SigninFormField.password, valid);
  }

  _updateValidate(SigninFormField field, bool valid) {
    final fieldBit = 1 << field.index;
    final currentState = (_isValid & fieldBit == fieldBit);
    // check state and update if needed
    if (valid != currentState) {
      if (!valid) {
        _isValid ^= fieldBit;
      } else {
        _isValid |= fieldBit;
      }
      send(SigninValidateEvent(
        status: valid ? EventStatus.success : EventStatus.error,
        field: field,
        message: 'missing data',
      ));

      if (_isValid == _validAll) {
        send(SigninValidateEvent(
          status: EventStatus.success,
          field: SigninFormField.all,
        ));
      }
    }
  }

  onSubmit() {
    send(SigninSubmitEvent(
      username: _username,
      password: _password,
    ));
  }
}
