enum SigninStatus { error, success }

enum SigninEventType { validate, authorize }

class SigninEvent {
  final SigninEventType type;
  final SigninStatus status;
  final dynamic data;

  SigninEvent(this.type, {required this.status, this.data});
}
