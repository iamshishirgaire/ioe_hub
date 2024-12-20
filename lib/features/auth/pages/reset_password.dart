import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ioe_hub/core/ui/app_button.dart';
import 'package:ioe_hub/features/auth/blocs/auth_bloc/auth_bloc.dart';

@RoutePage()
class AuthResetPasswordPage extends StatefulWidget {
  final String email;
  const AuthResetPasswordPage({super.key, required this.email});

  @override
  State<AuthResetPasswordPage> createState() => _AuthResetPasswordPageState();
}

class _AuthResetPasswordPageState extends State<AuthResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  String _otp = '';
  String _password = '';
  String _confirmPassword = '';
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESET PASSWORD'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/icons/otp.svg",
                  height: 250,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  readOnly: true,
                  initialValue: widget.email,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'OTP',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: Icon(
                          isObscure ? Iconsax.eye : Iconsax.eye_slash,
                        ),
                      )),
                  onChanged: (value) {
                    _otp = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter OTP';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'New Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: Icon(
                          isObscure ? Iconsax.eye : Iconsax.eye_slash,
                        ),
                      )),
                  obscureText: isObscure,
                  onChanged: (value) {
                    _password = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a new password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'Confirm Password'),
                  obscureText: true,
                  onChanged: (value) {
                    _confirmPassword = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
                  if (state is AuthResetPasswordSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                    //pop 2 times to go back to profile page
                    Navigator.pop(context);
                    Navigator.pop(context);
                  } else if (state is AuthResetPasswordFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                }, builder: (context, state) {
                  return AppButton(
                    isDisabled: (state is AuthResetPasswordLoading),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                          AuthResetPassword(
                            email: widget.email,
                            password: _password,
                            confirmPassword: _confirmPassword,
                            code: _otp,
                          ),
                        );
                      }
                    },
                    text: ('Reset Password'),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
