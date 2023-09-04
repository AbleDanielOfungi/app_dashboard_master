import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../home_page/notifiers/product_notifier.dart';
import 'widgets/popular_header_page.dart';

class PopularProducts extends ConsumerWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var products = ref.watch(desktopPopular);
    return Column(
      children: [
        const PopularHeaders(
          headerTitle: 'Popular Products',
          headerLabel: 'View More',
        ),
        products.when(
          data: (data) {
            return SizedBox(
              width: Get.width,
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.popularProducts.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    // width: 240,
                    width: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                                'assets/${data.popularProducts[index].image}',
                                // width: 30,
                                // height: 30,
                                fit: BoxFit.cover),
                          ),
                          // const SizedBox(height: 8),
                          Text(
                            data.popularProducts[index].title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${data.popularProducts[index].price}ugx',
                                        style: const TextStyle(
                                          color: Color(0xff018868),
                                          fontFamily: 'Cabin',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '/ ${data.popularProducts[index].per}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Cabin',
                                        ),
                                      )
                                    ],
                                  ),
                                  // const SizedBox(width: 25),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const FaIcon(
                                      FontAwesomeIcons.circlePlus,
                                      size: 20,
                                      color: Color(0xff018868),
                                    ),
                                  )
                                ],
                              ),
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
            // log('Error: $err');
            return const Text('No Data found');
          },
          loading: () => CircularProgressIndicator(
            color: Colors.green.shade900,
          ),
        ),
      ],
    );
  }
}
