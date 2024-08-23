import 'controller.dart';

enum EventStatus { error, success, processing }

class Event<T> {
  final EventStatus status;
  final String? message;
  final T? data;

  Event({this.status = EventStatus.success, this.message, this.data});
}

extension StreamEventExtension<T extends Event> on Stream<T> {
  Stream<T> byStatus(EventStatus status) {
    return where((event) => event.status == status);
  }
}

extension ControllerEventExtension<T extends Event> on Controller<T> {
  Stream<T> byStatus(EventStatus status) {
    return stream.where((event) => event.status == status);
  }
}
