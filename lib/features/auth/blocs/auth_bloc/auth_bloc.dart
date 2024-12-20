import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ioe_hub/features/auth/models/user.dart';
import 'package:ioe_hub/features/auth/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthRegister>((event, emit) async {
      emit(AuthRegisterLoading());
      try {
        await _authRepository.registerWithEmail(event.user, event.password);
        emit(const AuthRegisterSuccess("Registered Successfully"));
      } catch (e) {
        if (e is DioException) {
          emit(AuthRegisterFailure(
              message: e.response?.data["message"] ?? "Failed to register"));
        } else {
          emit(
            const AuthRegisterFailure(message: "Something went wrong"),
          );
        }
      }
    });
    on<AuthLogin>((event, emit) async {
      try {
        emit(AuthLoginLoading());
        await Future.delayed(const Duration(seconds: 3), () {});
        final (message, accessToken, refreshToken) =
            await _authRepository.loginWithEmail(event.email, event.password);
        emit(AuthLoginSuccess(message));
      } catch (e) {
        if (e is DioException) {
          emit(AuthLoginFailure(
              message: e.response?.data["message"] ?? "Failed to login"));
        } else {
          emit(
            const AuthLoginFailure(message: "Something went wrong"),
          );
        }
      }
    });
    on<AuthGoogleLogin>((event, emit) async {
      emit(AuthGoogleLoginLoading());
      try {
        final (message, accessToken, refreshToken) =
            await _authRepository.loginWithGoogle(event.token);
        emit(AuthGoogleLoginSuccess(message));
      } catch (e) {
        if (e is DioException) {
          emit(AuthGoogleLoginFailure(
              message: e.response?.data["message"] ?? "Failed to login"));
        }
        emit(AuthGoogleLoginFailure(message: e.toString()));
      }
    });

    on<AuthGetResetPasswordCode>((event, emit) async {
      emit(AuthOtpLoading());
      try {
        final message = await _authRepository.getResetPasswordCode(event.email);
        emit(AuthOtpSuccess(
            message ?? "Otp Sent successfully. Check your mail"));
      } catch (e) {
        if (e is DioException) {
          emit(AuthOtpFailure(
              message: e.response?.data["message"] ?? "Failed to get OTP"));
        }
        emit(const AuthOtpFailure(message: "Something went wrong"));
      }
    });
    on<AuthResetPassword>((event, emit) async {
      emit(AuthResetPasswordLoading());
      try {
        final message = await _authRepository.resetPassword(
            event.email, event.password, event.confirmPassword, event.code);
        emit(AuthResetPasswordSuccess(message));
      } catch (e) {
        if (e is DioException) {
          emit(AuthResetPasswordFailure(
              message:
                  e.response?.data["message"] ?? "Failed to reset password"));
        }
        emit(const AuthResetPasswordFailure(message: "Something went wrong"));
      }
    });
    on<AuthCheckLoggedIn>((event, emit) async {
      emit(const AuthCheckLoadingState());
      try {
        final user = await _authRepository.checkLoggedIn();
        if (user == null) {
          emit(const AuthCheckLoggedOutState());
          return;
        }
        emit(AuthCheckLoggedInState(user));
      } catch (e) {
        emit(const AuthCheckLoggedOutState());
      }
    });

    on<AuthLogOut>((event, emit) async {
      emit(AuthLogoutLoading());
      try {
        await _authRepository.logout();
        emit(const AuthLogoutSuccess("Logged Out Successfully"));
      } catch (e) {
        emit(const AuthLogoutFailure(message: "Failed to logout"));
      }
    });
  }
}
