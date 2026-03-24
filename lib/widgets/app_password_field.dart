import 'package:flutter/material.dart';

class AppPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final VoidCallback onTap;

  const AppPasswordField({
    super.key,
    required this.controller,
    required this.hint,
    required this.obscure,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
  hintText: hint,
  prefixIcon: const Icon(Icons.lock_outline, size: 20),
  suffixIcon: GestureDetector(
    onTap: onTap,
    child: Icon(
      obscure
          ? Icons.visibility_off_outlined
          : Icons.visibility_outlined,
    ),
  ),
),
    );
  }
}