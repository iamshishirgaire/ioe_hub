import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ioe_hub/core/router/router.gr.dart';
import 'package:ioe_hub/core/ui/app_button.dart';
import 'package:ioe_hub/features/auth/blocs/auth_bloc/auth_bloc.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
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
                    "assets/icons/login.svg",
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      AutoRouter.of(context).push(const ForgotPasswordRoute());
                    },
                    child: Text(
                      'Forgot Password ?',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoginSuccess) {
                      context.read<AuthBloc>().add(const AuthCheckLoggedIn());
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                      Navigator.of(context).pop();
                    } else if (state is AuthLoginFailure) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                      isDisabled: state is AuthLoginLoading,
                      text: "Login",
                      onPressed: () {
                        setState(() {});
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(AuthLogin(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ));
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: 'Register',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            AutoRouter.of(context).push(const RegisterRoute());
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
