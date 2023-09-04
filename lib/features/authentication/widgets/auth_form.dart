import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthForm extends StatelessWidget {
  AuthForm({
    super.key,
    this.validator,
    this.onSaved,
    this.hintText,
    required this.label,
    required this.controller,
    this.onFieldSubmitted,
  });

  String? Function(String?)? validator;
  void Function(String?)? onSaved;
  String? hintText;
  String label;
  TextEditingController controller;
  void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            // color: Color.fromARGB(255, 24, 22, 22),
            color: Color(0XFF1A202C),
            fontWeight: FontWeight.w500,
            fontFamily: 'Cabin',
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 36,
          child: TextFormField(
            validator: validator,
            textAlignVertical: TextAlignVertical.bottom,
            cursorColor: Colors.black,
            style: const TextStyle(
              color: Color(0XFFA0AEC0),
            ),
            onFieldSubmitted: onFieldSubmitted,
            onSaved: onSaved,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(61, 60, 60, 0.2),
                ),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontFamily: 'Cabin',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0XFFA0AEC0),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 34, 104, 235)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
