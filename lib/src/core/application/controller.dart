import 'dart:async';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';

class Controller<T> implements Disposable {
  final StreamController<T> _controller = StreamController.broadcast();

  Stream<T> get stream => _controller.stream;

  Stream<X> on<X>() {
    return _controller.stream.where((event) => event is X).cast();
  }

  send(T event) {
    log('send event: $event');
    _controller.sink.add(event);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
