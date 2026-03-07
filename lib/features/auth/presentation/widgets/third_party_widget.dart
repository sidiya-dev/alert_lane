import 'package:alert_lane/features/auth/presentation/third_party_widgets_data.dart';
import 'package:alert_lane/features/auth/presentation/widgets/third_party_login_widget.dart.dart';
import 'package:flutter/material.dart';

class ThirdPartySection extends StatelessWidget {
  const ThirdPartySection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: thirdPartyData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3,
      ),
      itemBuilder: (context, index) {
        final login = thirdPartyData[index];
        return LoginWithWidget(
          thirdPartyLogo: login["thirdPartyLogo"],
          thirdPartyName: login["thirdPartyName"],
          onTap: login['onTap'],
        );
      },
    );
  }
}
