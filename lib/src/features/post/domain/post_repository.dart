import 'package:wordpress_client/wordpress_client.dart' as wpsdk;

import 'package:app/base.dart';
import 'package:app/post.dart';

class PostRepository {
  Future<List<Post>> list(ListRequestBase req) async {
    final res = await wp.posts.list(wpsdk.ListPostRequest(
      page: req.page,
      perPage: req.perPage,
    ));

    if (res.isFailure) {
      throw Exception(res.message);
    }

    final items = res.dataOrNull() ?? [];
    return items
        .map(
          (e) => Post(
            slug: e.slug,
            date: e.date,
            modified: e.modified,
            title: e.title?.rendered,
            content: e.content?.rendered,
          ),
        )
        .toList();
  }

  Future<Post?> get(int id) async {
    final res = await wp.posts.retrive(wpsdk.RetrivePostRequest(id: id));
    if (res.isFailure) {
      throw Exception(res.message);
    }

    final e = res.dataOrNull();
    if (e == null) {
      return null;
    }

    return Post(
      slug: e.slug,
      date: e.date,
      modified: e.modified,
      title: e.title?.rendered,
      content: e.content?.rendered,
    );
  }
}
