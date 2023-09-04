import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterBox extends ConsumerWidget {
  const FilterBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FaIcon(
              FontAwesomeIcons.filter,
              color: Colors.green,
              size: 20,
            ),
            Text(
              'Filter',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
