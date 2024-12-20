import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void initializeTheme() async {
    var sp = await SharedPreferences.getInstance();
    final brightness = ThemeMode.values.firstWhere(
      (element) => element.name == (sp.getString('themeMode') ?? 'system'),
      orElse: () => ThemeMode.system,
    );
    emit(brightness);
  }

  Future<void> setTheme(ThemeMode mode) async {
    await SharedPreferences.getInstance()
        .then((sp) => sp.setString('themeMode', mode.name));
    emit(mode);
  }
}
