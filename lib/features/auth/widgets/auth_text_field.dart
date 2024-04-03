import 'package:flutter/material.dart';

class RegistrationTextField extends StatelessWidget {
  final String prefixImage;
  final String hintText;
  final TextEditingController controller;
  final String? errorText;
  final TextInputType? keyboardType;
  const RegistrationTextField(
      {super.key,
      this.errorText,
      this.keyboardType,
      required this.hintText,
      required this.prefixImage,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          hintText: hintText,
          hintStyle:
              TextStyle(color: errorText != null ? Colors.red : Colors.grey),
          prefixIcon: Image.asset(
            prefixImage,
            color: errorText != null ? Colors.red : Colors.grey,
          ),
          errorText: errorText,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(
                16,
              ),
            ),
          ),
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
