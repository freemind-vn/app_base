import 'package:app/product.dart';

class ProductCategoryRepository {
  List<Category> list() {
    // Call data layer / sdk, then
    return [
      Category(1, 'Bùn khoáng'),
      Category(2, 'Mỹ phẩm'),
      Category(3, 'Tinh dầu'),
    ];
  }
}
