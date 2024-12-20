part of 'splash_bloc.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashLoading extends SplashState {}

class NavigateToOnboarding extends SplashState {}

class NavigateToHome extends SplashState {}
