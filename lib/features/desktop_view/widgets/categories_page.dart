import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../home_page/notifiers/product_notifier.dart';
import 'filter_box.dart';
import 'prev_next_buttons.dart';

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var categories = ref.watch(categoriesProvider);
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                FilterBox(),
                SizedBox(width: 20),
                PreNextButtons(),
              ],
            )
          ],
        ),
        const SizedBox(height: 18),
        categories.when(
          data: (data) {
            return SizedBox(
              width: Get.width,
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.popularProducts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/${data.popularProducts[index].image}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data.popularProducts[index].title,
                        style: const TextStyle(color: Colors.black),
                      )
                    ],
                  );
                },
              ),
            );
          },
          error: (err, stackTrace) {
            log('Error: $err');
            return const Text(
              'No Data found',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w800,
              ),
            );
          },
          loading: () => CircularProgressIndicator(
            color: Colors.green.shade900,
          ),
        ),
      ],
    );
  }
}
