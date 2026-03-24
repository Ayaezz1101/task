import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final String? Function(String?)? validator; 

  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.validator, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField( 
      controller: controller,
      validator: validator, 
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, size: 20),
        errorStyle: const TextStyle(fontSize: 12), 
      ),
    );
  }
}