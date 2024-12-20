part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthRegister extends AuthEvent {
  final User user;
  final String password;

  const AuthRegister({required this.user, required this.password});

  @override
  List<Object> get props => [user, password];
}

class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  const AuthLogin({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class AuthLogOut extends AuthEvent {}

class AuthGoogleLogin extends AuthEvent {
  final String token;

  const AuthGoogleLogin({required this.token});

  @override
  List<Object> get props => [token];
}

class AuthResetPassword extends AuthEvent {
  final String email;
  final String password;
  final String confirmPassword;
  final String code;

  const AuthResetPassword(
      {required this.email,
      required this.password,
      required this.confirmPassword,
      required this.code});

  @override
  List<Object> get props => [email, password, confirmPassword, code];
}

class AuthGetResetPasswordCode extends AuthEvent {
  final String email;

  const AuthGetResetPasswordCode({required this.email});

  @override
  List<Object> get props => [email];
}

class AuthCheckLoggedIn extends AuthEvent {
  const AuthCheckLoggedIn();

  @override
  List<Object> get props => [];
}
