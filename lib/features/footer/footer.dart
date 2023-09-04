import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(text: '©  2023 '),
                    TextSpan(
                      text: 'YOOKATALE',
                      style: TextStyle(
                          color: Color.fromRGBO(24, 95, 45, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' All rights reserved'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FooterLinks(onPressed: () {}, label: 'Faqs'),
                  FooterLinks(onPressed: () {}, label: 'Privacy Policy'),
                  FooterLinks(
                    onPressed: () {},
                    label: 'Usage Policy',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FooterLinks extends StatelessWidget {
  const FooterLinks({super.key, required this.onPressed, required this.label});

  final Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
