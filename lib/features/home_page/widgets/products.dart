import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/models/products_model.dart';
import '../../common/widgets/custom_button.dart';
import '../../payment/widgets/flutter_wave.dart';

class ProductsPage extends ConsumerWidget {
  ProductsPage({super.key, this.productProvider, this.title});
  AsyncValue<Products>? productProvider;
  String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var productProvider = ref.watch(productsProvider);
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 50),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromRGBO(0, 0, 0, 0.1),
            ),
          ),
        ),
        // height: 500,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                      Container(
                        height: 2.5,
                        width: 80,
                        color: const Color.fromRGBO(24, 95, 45, 1),
                      )
                    ],
                  ),
                  TextButton(
                    child: const Text(
                      'View More',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            productProvider!.when(
              data: (value) {
                return SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.popularProducts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 200,
                        child: Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          elevation: 3,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 170,
                                width: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/${value.popularProducts[index].image}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                value.popularProducts[index].title,
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                'UGX${value.popularProducts[index].price}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromRGBO(24, 95, 45, 1),
                                ),
                              ),
                              const SizedBox(height: 16),
                              CustomButton(
                                width: 170,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const FlutterWavePage(
                                              title: 'Payment Page'),
                                    ),
                                  );
                                },
                                title: 'Add To cart',
                                icon: const FaIcon(
                                  FontAwesomeIcons.cartPlus,
                                  color: Color.fromRGBO(247, 245, 245, 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              error: (err, stackTrace) {
                log('Error: $err');
                return const Text('No Data found');
              },
              loading: () => CircularProgressIndicator(
                color: Colors.green.shade900,
              ),
            )
          ],
        ));
  }
}
