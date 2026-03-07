import 'package:alert_lane/features/auth/domain/usecases/login_usecase.dart';
import 'package:alert_lane/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:alert_lane/features/auth/presentation/widgets/auth_button.dart';
import 'package:alert_lane/features/auth/presentation/widgets/auth_field.dart';
import 'package:alert_lane/features/auth/presentation/widgets/third_party_login_widget.dart.dart';
import 'package:alert_lane/features/auth/presentation/widgets/third_party_widget.dart';
import 'package:alert_lane/shared/utils/validators.dart';
import 'package:alert_lane/shared/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("${state.user.firstName} ${state.user.lastName}"),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is Loading) {
          return Scaffold(
            body: SafeArea(child: Center(child: CircularProgressIndicator())),
          );
        }

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
      },
    );
  }

  Widget _buildHeader() {
    return const Center(
      child: Column(children: [LogoWidget(height: 80, width: 150)]),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
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
            validator: Validators.email,
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
          AuthField(
            validator: Validators.password,
            controller: _passwordController,
            placeholder: "password",
          ),

          SizedBox(height: 20),

          AuthButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) {
                return;
              }
              context.read<AuthBloc>().add(
                UserLogin(
                  params: LoginParams(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  ),
                ),
              );
            },
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
    return ThirdPartySection();
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
