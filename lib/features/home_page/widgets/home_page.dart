import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/our_services.dart';
import '../notifiers/product_notifier.dart';
import 'motto.dart';

import 'products.dart';
import 'register_button.dart';

class HomePage extends ConsumerWidget {
  HomePage({
    super.key,
  });

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var productProvider = ref.watch(productsProvider);
    var fruitProducts = ref.watch(fruitProvider);
    return SizedBox(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // TopIcons(),
            const Motto(),
            const OurServices(),
            ProductsPage(
              productProvider: productProvider,
              title: 'Popular Products',
            ),
            const RegisterWidget(),
            ProductsPage(
              productProvider: fruitProducts,
              title: 'Fruits Products',
            ),
          ],
        ),
      ),
    );
  }
}
