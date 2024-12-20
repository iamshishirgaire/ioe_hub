import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ioe_hub/core/ui/app_button.dart';
import 'package:ioe_hub/features/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:ioe_hub/features/auth/models/user.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _profilePicController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('REGISTER'),
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
                      "assets/icons/register.svg",
                      height: 250,
                      width: 250,
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        hintText: 'Email', prefixIcon: Icon(Icons.mail)),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter an email' : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: 'Password',
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
                    validator: (value) =>
                        value!.isEmpty ? 'Enter a password' : null,
                  ),
                  const SizedBox(height: 20),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthRegisterSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)));
                        context.read<AuthBloc>().add(const AuthCheckLoggedIn());
                        Navigator.of(context).pop();
                      } else if (state is AuthRegisterFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)));
                      }
                    },
                    builder: (context, state) {
                      return AppButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(AuthRegister(
                                  password: _passwordController.text,
                                  user: User(
                                    id: "user",
                                    userName: _usernameController.text,
                                    email: _emailController.text,
                                    profilePic: _profilePicController.text,
                                  ),
                                ));
                          }
                        },
                        isDisabled: (state is AuthRegisterLoading),
                        text: "Register",
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: 'Login',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pop();
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
