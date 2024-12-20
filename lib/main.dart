import 'dart:io';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ioe_hub/core/di/di_config.dart';
import 'package:ioe_hub/core/router/router.dart';
import 'package:ioe_hub/core/theme/bloc/theme_bloc.dart';
import 'package:ioe_hub/core/theme/text_theme.dart';
import 'package:ioe_hub/core/theme/theme.dart';
import 'package:ioe_hub/features/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:ioe_hub/features/file_downloads/blocs/file_download_bloc/file_download_bloc.dart';
import 'package:ioe_hub/features/my_space/blocs/my_space_bloc/my_space_bloc.dart';
import 'package:ioe_hub/features/my_space/blocs/my_space_bloc/my_space_event.dart';
import 'package:ioe_hub/features/notes/blocs/note_bloc/note_bloc.dart';
import 'package:ioe_hub/features/notes/blocs/note_bloc/note_event.dart';
import 'package:ioe_hub/features/pastPaper/bloc/questions_bloc.dart';
import 'package:ioe_hub/features/profile/blocs/questions_bloc/offline_questions_bloc.dart';
import 'package:ioe_hub/firebase_options.dart';

class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  const fatalError = true;
  await dotenv.load(fileName: ".env");

  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };
  HttpOverrides.global = MyHttpoverrides();
  configureDependencies();
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Raleway", "Raleway");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ThemeCubit>()..initializeTheme(),
        ),
        BlocProvider(
          create: (context) => getIt<FileDownloadBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<OfflineQuestionsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<NoteBloc>()..add(const FetchNotes()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<QuestionsBloc>()..add(const LoadQuestions()),
        ),
        BlocProvider(
            create: (context) =>
                getIt<MySpaceBloc>()..add(LoadCurrentSpaceEvent())),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: theme.light(),
            darkTheme: theme.dark(),
            debugShowCheckedModeBanner: false,
            themeMode: state,
            routerConfig: _appRouter.config(),
          );
        },
      ),
    );
  }
}
