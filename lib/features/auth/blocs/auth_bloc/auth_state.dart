part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

//
final class AuthRegisterLoading extends AuthState {}

final class AuthRegisterSuccess extends AuthState {
  final String message;
  const AuthRegisterSuccess(this.message);
}

final class AuthRegisterFailure extends AuthState {
  final String message;
  const AuthRegisterFailure({required this.message});
}

//
final class AuthLoginLoading extends AuthState {}

final class AuthLoginSuccess extends AuthState {
  final String message;
  const AuthLoginSuccess(this.message);
}

final class AuthLoginFailure extends AuthState {
  final String message;
  const AuthLoginFailure({required this.message});
}

//
final class AuthGoogleLoginLoading extends AuthState {}

final class AuthGoogleLoginSuccess extends AuthState {
  final String message;
  const AuthGoogleLoginSuccess(this.message);
}

final class AuthGoogleLoginFailure extends AuthState {
  final String message;
  const AuthGoogleLoginFailure({required this.message});
}

//
final class AuthOtpLoading extends AuthState {}

final class AuthOtpSuccess extends AuthState {
  final String message;
  const AuthOtpSuccess(this.message);
}

final class AuthOtpFailure extends AuthState {
  final String message;
  const AuthOtpFailure({required this.message});
}

//
final class AuthLogoutLoading extends AuthState {}

final class AuthLogoutSuccess extends AuthState {
  final String message;
  const AuthLogoutSuccess(this.message);
}

final class AuthLogoutFailure extends AuthState {
  final String message;
  const AuthLogoutFailure({required this.message});
}

//
final class AuthCheckLoggedInState extends AuthState {
  final User user;
  const AuthCheckLoggedInState(this.user);
}

final class AuthCheckLoadingState extends AuthState {
  const AuthCheckLoadingState();
}

final class AuthCheckLoggedOutState extends AuthState {
  const AuthCheckLoggedOutState();
}

final class AuthResetPasswordLoading extends AuthState {}

final class AuthResetPasswordSuccess extends AuthState {
  final String message;
  const AuthResetPasswordSuccess(this.message);
}

final class AuthResetPasswordFailure extends AuthState {
  final String message;
  const AuthResetPasswordFailure({required this.message});
}
