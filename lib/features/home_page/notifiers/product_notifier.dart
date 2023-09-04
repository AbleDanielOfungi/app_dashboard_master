import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/models/products_model.dart';
import '../services/product_service.dart';

final productsProvider = FutureProvider.autoDispose<Products>((ref) async {
  return await ProductService.fetchProducts(
      url: 'assets/popular_products.json');
});

final fruitProvider = FutureProvider.autoDispose<Products>(
  (ref) async =>
      await ProductService.fetchProducts(url: 'assets/fruit_products.json'),
);

final categoriesProvider = FutureProvider.autoDispose<Products>(
  (ref) async =>
      await ProductService.fetchProducts(url: 'assets/categories.json'),
);

final desktopPopular = FutureProvider.autoDispose<Products>(
  (ref) async =>
      await ProductService.fetchProducts(url: 'assets/desktop_popular.json'),
);
