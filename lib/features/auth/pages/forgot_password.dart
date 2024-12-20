import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ioe_hub/core/router/router.gr.dart';
import 'package:ioe_hub/core/ui/app_button.dart';
import 'package:ioe_hub/core/utils/validator.dart';
import 'package:ioe_hub/features/auth/blocs/auth_bloc/auth_bloc.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FORGOT PASSWORD'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: SvgPicture.asset(
                    "assets/icons/forgot_password.svg",
                    height: 250,
                    width: 250,
                  ),
                ),
                TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        hintText: 'Email', prefixIcon: Icon(Icons.mail)),
                    validator: (value) => isValidEmail(value)),
                const SizedBox(height: 20),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthOtpFailure) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    } else if (state is AuthOtpSuccess) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                      // startTimer(); // Start the timer after OTP is sent
                      AutoRouter.of(context).push(
                          AuthResetPasswordRoute(email: _emailController.text));
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        AppButton(
                          isDisabled: state is AuthOtpLoading,
                          text: "Send OTP",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context
                                  .read<AuthBloc>()
                                  .add(AuthGetResetPasswordCode(
                                    email: _emailController.text,
                                  ));
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
