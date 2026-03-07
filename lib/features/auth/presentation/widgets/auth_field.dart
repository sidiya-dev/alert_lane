import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    super.key,
    required this.controller,
    required this.placeholder,
    required this.validator,
    this.isPassword = false,
  });
  final TextEditingController controller;
  final String placeholder;
  final FormFieldValidator<String>? validator;
  final bool? isPassword;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword! && isVisible,
      validator: widget.validator,
      decoration: InputDecoration(
        
        contentPadding: EdgeInsets.all(20),
        hintText: widget.placeholder,
        suffixIcon: widget.isPassword!
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: Icon(
                  widget.isPassword! && isVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }
}
