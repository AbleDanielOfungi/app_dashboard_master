import 'package:flutter/material.dart';

import '../../common/widgets/custom_button.dart';

class SubscribeSection extends StatelessWidget {
  const SubscribeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Subscribe for our newsletter',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(top: 16),
          height: 48,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.white),
          ),
          child: const TextField(
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: 'Enter your email',
              hintStyle: TextStyle(color: Color.fromARGB(255, 121, 135, 143)),
              fillColor: Colors.white,
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'By clicking "Subscribe" I agree to recive news, promotions, informations and offers from Yookatale',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomButton(
            onPressed: () {},
            title: 'Subscribe',
          ),
        )
      ],
    );
  }
}
