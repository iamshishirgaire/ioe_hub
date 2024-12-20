import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashLoading()) {
    on<CheckInitialLaunchEvent>((event, emit) async {
      // Simulate loading (you can remove this delay in production)
      await Future.delayed(const Duration(seconds: 2));

      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isInitial = prefs.getBool('isInitial') ?? true;

      if (isInitial) {
        emit(NavigateToOnboarding());
        prefs.setBool('isInitial', false);
      } else {
        emit(NavigateToHome());
        prefs.setBool('isInitial', false);
      }
    });
  }
}
