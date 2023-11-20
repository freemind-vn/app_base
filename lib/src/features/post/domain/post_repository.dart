import 'models.dart';

abstract class PostRepository {
  Future<List<Post>> list(ListPostRequest req);
  Future<Post?> get(int id);
}
