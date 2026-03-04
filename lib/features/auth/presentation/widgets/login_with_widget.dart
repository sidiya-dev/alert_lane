import 'package:flutter/material.dart';

class LoginWithWidget extends StatelessWidget {
  final IconData thirdPartyLogo;
  final String thirdPartyName;
  final GestureTapCallback? onTap;
  const LoginWithWidget({
    super.key,
    required this.thirdPartyLogo,
    required this.thirdPartyName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(26),
        ),
        child: Row(
          children: [
            Icon(thirdPartyLogo),
            SizedBox(width: 5),
            Text(
              thirdPartyName,
              style: TextTheme.of(
                context,
              ).bodyMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
