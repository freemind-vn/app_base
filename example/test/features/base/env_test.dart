import 'package:flutter_test/flutter_test.dart';

void main() {
  test('environments', () {
    expect(const String.fromEnvironment('SERVICE_HOST'), isNotEmpty);
    expect(const String.fromEnvironment('SERVICE_SCHEME'), isNotEmpty);
  });
}
