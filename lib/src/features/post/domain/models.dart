class Post {
  Post({
    this.slug,
    this.date,
    this.modified,
    this.title,
    this.content,
    this.media,
  });

  final String? slug;
  final DateTime? date;
  final DateTime? modified;
  final String? title;
  final String? content;
  final String? media; // wp:featuredmedia[0]
}

class ListPostRequest {
  ListPostRequest({this.page = 1, this.perPage = 10});

  final int page;
  final int perPage;
}
