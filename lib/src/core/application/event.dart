enum EventStatus { error, success, processing }

abstract class BaseEvent {
  final EventStatus status;
  final String? message;

  BaseEvent({this.status = EventStatus.success, this.message});
}

extension StreamBaseEventExtension<T extends BaseEvent> on Stream<T> {
  Stream<T> byStatus(EventStatus status) {
    return where((event) => event.status == status);
  }
}
