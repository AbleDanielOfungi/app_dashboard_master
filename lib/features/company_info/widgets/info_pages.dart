import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/controller/quick_order_controller.dart';
import '../../common/widgets/custom_button.dart';

class InfoPages extends StatelessWidget {
  InfoPages({super.key});

  final List<String> pages = ['Contacts', 'About', 'News Blog', 'Careers'];
  final QuickOrderController orderController = QuickOrderController();

  void pagesPressed({int? index}) {
    log('Index: $index');
    if (index == 0) {
      // navigate to  Contacts page
      log('Index: $index');
    } else if (index == 1) {
      // navigate to About Us page
      log('Index: $index');
    } else if (index == 2) {
      // navigate to News Blog page
      log('Index: $index');
    } else if (index == 3) {
      // navigate to Careers page
      log('Index: $index');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      child: Text(
                        pages[index],
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      onPressed: () {
                        pagesPressed(index: index);
                      },
                    ),
                  );
                }),
          ),
          CustomButton(
            color: const Color.fromRGBO(37, 134, 66, 1),
            onPressed: () {
              orderController.quickOrder();
            },
            title: 'Quick Order',
            icon: const FaIcon(
              FontAwesomeIcons.whatsapp,
              color: Colors.white,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
