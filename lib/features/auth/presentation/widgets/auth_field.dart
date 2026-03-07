import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.controller,
    required this.placeholder, required this.validator,
  });
  final TextEditingController controller;
  final String placeholder;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: placeholder,
      ),
    );
  }
}
