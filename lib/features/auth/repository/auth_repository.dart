import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:ioe_hub/core/api/dio.dart';
import 'package:ioe_hub/core/di/modules/shared_preferences.dart';
import 'package:ioe_hub/features/auth/models/user.dart';

@Injectable()
class AuthRepository {
  final ApiClient _apiClient;
  final AppSharedPreferences _sp;
  AuthRepository(this._apiClient, this._sp);

  Future<void> registerWithEmail(User user, String password) async {
    await _apiClient.post("/auth/register", {
      "email": user.email,
      "password": password,
    });
  }

  Future<(String, String, String)> loginWithEmail(
      String email, String password) async {
    final response = await _apiClient.post("/auth/login", {
      "email": email,
      "password": password,
    });
    var message = response.data["message"] as String;
    var accessToken = response.data["accessToken"] as String;
    var refreshToken = response.data["refreshToken"] as String;
    var user = User.fromJson(response.data["user"] as Map<String, dynamic>);
    _sp.saveString("accessToken", accessToken);
    _sp.saveString("refreshToken", refreshToken);
    _sp.saveString("user", jsonEncode(user));
    return (message, accessToken, refreshToken);
  }

  Future<(String, String, String)> loginWithGoogle(String token) async {
    final response = await _apiClient.post("/auth/login", {
      "token": token,
    });
    var message = response.data["message"] as String;
    var accessToken = response.data["accessToken"] as String;
    var refreshToken = response.data["refreshToken"] as String;
    var user = User.fromJson(response.data["user"] as Map<String, dynamic>);
    _sp.saveString("accessToken", accessToken);
    _sp.saveString("refreshToken", refreshToken);
    _sp.saveString("user", jsonEncode(user));

    return (message, accessToken, refreshToken);
  }

  Future<String> resetPassword(String email, String password,
      String confirmPassword, String code) async {
    final response = await _apiClient.post("/auth/reset-password",
        {"email": email, "password": password, "otp": code});
    return response.data["message"] as String;
  }

  Future<String?> getResetPasswordCode(String email) async {
    final response =
        await _apiClient.post("/auth/sendResetPasswordOtp", {"email": email});
    return response.data["message"] as String?;
  }

  Future<User?> checkLoggedIn() async {
    final response = await _sp.getString("user");
    if (response == null || response.isEmpty) {
      return null;
    }
    return User.fromJson(jsonDecode(response));
  }

  Future<void> logout() async {
    _sp.remove("user");
    _sp.remove("accessToken");
    _sp.remove("refreshToken");
  }
}
