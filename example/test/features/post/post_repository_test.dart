import 'package:flutter_test/flutter_test.dart';

import 'package:app/base.dart';
import 'package:app/post.dart';

void main() {
  group('test post repository', () {
    final repository = PostRepository();

    test('list', () async {
      expect(
        await repository.list(ListRequestBase()),
        const TypeMatcher<List<Post>>(),
      );
    });

    test('get', () async {
      expect(await repository.get(1), const TypeMatcher<Post>());
    });
  });
}
