import 'package:app/base.dart';
import 'models.dart';

abstract class PostRepository {
  Future<List<Post>> list(ListRequest req);
  Future<Post?> get(int id);
}
