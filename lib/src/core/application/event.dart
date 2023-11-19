enum EventStatus { error, success, processing }

abstract class BaseEvent {
  final EventStatus status;

  BaseEvent({required this.status});
}

extension StreamBaseEventExtension<T extends BaseEvent> on Stream<T> {
  Stream<T> byStatus(EventStatus status) {
    return where((event) => event.status == status);
  }
}
