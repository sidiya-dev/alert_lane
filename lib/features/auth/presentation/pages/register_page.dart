import 'package:alert_lane/core/router/app_router.dart';
import 'package:alert_lane/features/auth/presentation/widgets/auth_button.dart';
import 'package:alert_lane/features/auth/presentation/widgets/auth_field.dart';
import 'package:alert_lane/features/auth/presentation/widgets/third_party_widget.dart';
import 'package:alert_lane/shared/utils/validators.dart';
import 'package:alert_lane/shared/widgets/logo_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isAgreeOnTermsAndPolicy = false;

  final _termsRecognizer = TapGestureRecognizer();
  final _privacyRecognizer = TapGestureRecognizer();

  @override
  void dispose() {
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

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
                  SizedBox(height: 15),
                  _buildForm(),
                  SizedBox(height: 15),
                  _buildTermsPolicyAgreement(),
                  _buildSeperator(),
                  SizedBox(height: 15),
                  _buildThirdPartyLogin(),
                  SizedBox(height: 15),
                  _buildLoginLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentGeometry.topLeft,
          child: LogoWidget(width: 100),
        ),
        SizedBox(height: 5),
        Text("Start contributing to safer roads today"),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "First Name",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          AuthField(
            validator: Validators.firstName,
            controller: _firstNameController,
            placeholder: "John Doe",
          ),
          Text(
            "Last Name",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: 10),
          AuthField(
            validator: Validators.lastName,
            controller: _lastNameController,
            placeholder: "John Doe",
          ),

          Text(
            "Email Address",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          AuthField(
            validator: Validators.email,
            controller: _emailController,
            placeholder: "name@example.com",
          ),

          Text(
            "Phone Number",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          AuthField(
            validator: Validators.phone,
            controller: _phoneController,
            placeholder: "phone number",
          ),

          Text(
            "Password",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          AuthField(
            validator: Validators.password,
            controller: _passwordController,
            placeholder: "********",
            isPassword: true,
          ),

          Text(
            "Confirm Password",
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          AuthField(
            validator: (value) => Validators.confirmPassword(
              value?.trim(),
              _passwordController.text.trim(),
            ),
            controller: _confirmPasswordController,
            placeholder: "********",
            isPassword: true,
          ),

          SizedBox(height: 20),

          AuthButton(
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [Text("Sign Up"), Icon(Icons.arrow_forward)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTermsPolicyAgreement() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: isAgreeOnTermsAndPolicy,
          onChanged: (value) {
            setState(() {
              isAgreeOnTermsAndPolicy = value ?? false;
            });
          },
        ),
        Flexible(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                const TextSpan(text: 'I agree to the '),
                TextSpan(
                  text: 'Terms of Service',
                  style: TextTheme.of(
                    context,
                  ).bodySmall!.copyWith(fontWeight: FontWeight.w500),
                  recognizer: _termsRecognizer..onTap = null,
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextTheme.of(
                    context,
                  ).bodySmall!.copyWith(fontWeight: FontWeight.w500),
                  recognizer: _privacyRecognizer..onTap = null,
                ),
              ],
            ),
          ),
        ),
      ],
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
        Text("Or sign up with", style: TextTheme.of(context).bodyMedium),
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
    return ThirdPartySection();
  }

  Widget _buildLoginLink() {
    return GestureDetector(
      onTap: () {
        context.go(AppRoutes.login);
      },
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: "Already have an account?"),
            TextSpan(
              text: " Login Here",
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
