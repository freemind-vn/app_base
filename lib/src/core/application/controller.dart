import 'dart:async';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/core.dart';

extension ControllerBaseEventExtension<T extends BaseEvent> on Controller<T> {
  Stream<T> byStatus(EventStatus status) {
    return stream.where((event) => event.status == status);
  }
}

abstract class Controller<T> implements Disposable {
  final StreamController<T> _controller = StreamController.broadcast();
  static final StreamController<Controller> _streamController =
      StreamController.broadcast();

  Stream<T> get stream => _controller.stream;

  Controller() {
    _streamController.sink.add(this);
  }

  static StreamSubscription<X> onNew<X>(
    void Function(X)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return _streamController.stream
        .where(
          (event) => event is X,
        )
        .cast<X>()
        .listen(
          onData,
          onError: onError,
          onDone: onDone,
          cancelOnError: cancelOnError,
        );
  }

  StreamSubscription<T> Function(
    void Function(T event)? onData, {
    bool? cancelOnError,
    void Function()? onDone,
    Function? onError,
  }) get listen => _controller.stream.listen;

  Stream<X> on<X>() {
    return _controller.stream.where((event) => event is X).cast();
  }

  void send(T event) {
    log('send event: $event');
    _controller.sink.add(event);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
