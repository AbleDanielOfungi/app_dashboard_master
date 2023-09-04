import 'dart:developer';

import 'package:flutter/material.dart';

class ProductsLinkPage extends StatelessWidget {
  ProductsLinkPage({super.key});

  final List<String> pages = [
    'Roughages',
    'Fruits',
    'Root Tubers',
    'Vegetables',
    'Grain And Flour',
    'Meats',
    'Fats&Oils',
    'Herbs&Spices',
    'Juice&Meals'
  ];

  void linkPressed({int? index}) {
    log('Index: $index');
    if (index == 0) {
      // navigate to  Roughages page
      log('Index: $index');
    } else if (index == 1) {
      // navigate to Fruits page
      log('Index: $index');
    } else if (index == 2) {
      // navigate to Root Tubers page
      log('Index: $index');
    } else if (index == 3) {
      // navigate to Vegetables page
      log('Index: $index');
    } else if (index == 4) {
      // navigate to Grain And Flour page
      log('Index: $index');
    } else if (index == 5) {
      // navigate to Meats page
      log('Index: $index');
    } else if (index == 6) {
      // navigate to Fats&Oils page
      log('Index: $index');
    } else if (index == 7) {
      // navigate to Herbs&Spices page
      log('Index: $index');
    } else if (index == 8) {
      // navigate to Juice&Meals page
      log('Index: $index');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  linkPressed(index: index);
                },
                child: Text(
                  pages[index],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          }),
    );
  }
}
