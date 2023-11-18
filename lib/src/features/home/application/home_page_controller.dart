import 'package:app/core.dart';
import 'package:app/home.dart';
import 'package:app/product.dart';

class HomePageController extends Controller {
  final searchFieldController = HomeSearchFieldController();
  final productCategoryListController = ProductCategoryListController();
}
