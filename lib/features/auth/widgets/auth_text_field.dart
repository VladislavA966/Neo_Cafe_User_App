import 'package:flutter/material.dart';

class RegistrationTextField extends StatelessWidget {
  final String prefixImage;
  final String hintText;
  const RegistrationTextField(
      {super.key, required this.hintText, required this.prefixImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: TextEditingController(),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          hintText: hintText,
          prefixIcon: Image.asset(prefixImage),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}