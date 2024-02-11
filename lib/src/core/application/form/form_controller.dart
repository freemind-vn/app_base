import 'package:app_base/app_base.dart';

class FormController<T extends Enum> extends Controller {
  List<FormInputController?> _inputs = [];

  FormInputController<X>? getInput<X>(T input) =>
      _inputs[input.index] as FormInputController<X>;

  FormController(List<T> input) {
    _inputs = List.filled(input.length, null);
    _isValid = _validAll & 0xffff << input.length;
  }

  FormInputController<X> register<X>(
    T input,
    FormInputController<X> formInput,
  ) {
    if (_inputs[input.index] == null) {
      formInput.byType(FormInputEventType.validate).listen(
        (event) {
          _updateValid(input.index, event.message == null);
        },
      );
      _inputs[input.index] = formInput;
    }
    return _inputs[input.index]! as FormInputController<X>;
  }

  static const _validAll = 0xffff;
  int _isValid = 0;

  _updateValid(int index, bool valid) {
    final inputBit = 1 << index;
    final currentState = (_isValid & inputBit == inputBit);
    // check state and update if needed
    if (valid != currentState) {
      if (!valid) {
        _isValid ^= inputBit;
      } else {
        _isValid |= inputBit;
      }

      send(FormInputEvent());
    }
  }

  bool _isValidByIndex([int? index]) {
    if (index == null) {
      return _isValid == _validAll;
    }
    final inputBit = 1 << index;
    return (_isValid & inputBit == inputBit);
  }

  bool isValid([T? input]) {
    return _isValidByIndex(input?.index);
  }

  bool validate([T? input]) {
    if (input != null) {
      final v = getInput(input)?.validate() ?? true;
      _updateValid(input.index, v);
      return v;
    }
    for (var i = 0; i < _inputs.length; i++) {
      final v = (_inputs[i]?.validate() ?? true);
      _updateValid(i, v);
    }
    return isValid();
  }
}
