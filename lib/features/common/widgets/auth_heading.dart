import 'package:flutter/material.dart';

class AuthHeading extends StatelessWidget {
  const AuthHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Access your Account',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 16),
        const Text(
          'Sign In to Continue',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          color: Theme.of(context).primaryColor,
          width: 100,
          height: 2,
        ),
      ],
    );
  }
}
