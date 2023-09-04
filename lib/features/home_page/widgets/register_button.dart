import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/custom_button.dart';

class RegisterWidget extends ConsumerWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 500,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.1),
          ),
        ),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: 'While ',
                style: const TextStyle(
                  fontSize: 22,
                ),
                children: [
                  TextSpan(
                    text: 'Yookatale ',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const TextSpan(
                    text: 'is your mobile food ',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        const Text(
          'market...',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Subscribe to Yookatale, ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const TextSpan(
                    text: 'rest assured ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        const Text(
          'about all our everyday home kitchen',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        const Text(
          'needs',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        const SizedBox(height: 16),
        CustomButton(
          onPressed: () {},
          title: 'Register',
        )
      ]),
    );
  }
}
