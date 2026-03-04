import 'package:alert_lane/features/auth/presentation/widgets/auth_button.dart';
import 'package:alert_lane/features/auth/presentation/widgets/auth_field.dart';
import 'package:alert_lane/features/auth/presentation/widgets/login_with_widget.dart';
import 'package:alert_lane/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                const BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                children: [
                  _buildHeader(),
                  _buildForm(),
                  SizedBox(height: 15),
                  _buildSeperator(),
                  SizedBox(height: 15),
                  _buildThirdPartyLogin(),
                  SizedBox(height: 15),
                  _buildRegisterLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Center(
      child: Column(children: [LogoWidget(height: 80, width: 150)]),
    );
  }

  Widget _buildForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email Address",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          AuthField(
            controller: _emailController,
            placeholder: "name@example.com",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Password",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
              TextButton(
                style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                ),
                onPressed: () {},
                child: const Text("Forget Password?"),
              ),
            ],
          ),
          const SizedBox(height: 2),
          AuthField(controller: _passwordController, placeholder: "password"),

          SizedBox(height: 20),

          AuthButton(
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [Text("Sign In"), Icon(Icons.arrow_forward)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeperator() {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade800, width: .5),
            ),
          ),
        ),
        Text("Or Login With", style: TextTheme.of(context).bodyMedium),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade800, width: .5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildThirdPartyLogin() {
    return Column(
      children: [
        SizedBox(height: 15),
        Row(
          children: [
            LoginWithWidget(
              thirdPartyLogo: Icons.g_mobiledata,
              thirdPartyName: "Google",
              onTap: null,
            ),
            Spacer(),
            LoginWithWidget(
              thirdPartyLogo: Icons.apple,
              thirdPartyName: "Apple",
              onTap: null,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRegisterLink() {
    return GestureDetector(
      onTap: () {},
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "Don't Have an account?"),
            TextSpan(
              text: " Sign up",
              style: TextTheme.of(
                context,
              ).bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
