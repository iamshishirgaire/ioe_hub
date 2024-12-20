import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ioe_hub/core/router/router.gr.dart';
import 'package:ioe_hub/features/splash/bloc/splash_bloc.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> releaseSplashAndNavigate(PageRouteInfo route) async {
    FlutterNativeSplash.remove();
    AutoRouter.of(context).pushAndPopUntil(route, predicate: (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SplashBloc()..add(CheckInitialLaunchEvent()),
        child: Scaffold(
            body: BlocConsumer<SplashBloc, SplashState>(
                listener: (context, state) {
          if (state is NavigateToOnboarding) {
            releaseSplashAndNavigate(const OnBoardingRoute());
          }
          if (state is NavigateToHome) {
            releaseSplashAndNavigate(const HomeRoute());
          }
        }, builder: (context, state) {
          return const Scaffold();
        })));
  }
}
