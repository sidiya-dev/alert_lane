import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  const AuthButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 20),
        ),
        backgroundColor: const WidgetStatePropertyAll(
          Color(0xff0a3d61),
        ),
        elevation: WidgetStatePropertyAll(4),
        shadowColor: WidgetStatePropertyAll(const Color.fromARGB(255, 86, 86, 86)),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}


